{ pkgs, wallpaper }:

pkgs.stdenv.mkDerivation {
  name = "wallpaper-colors";
  src = wallpaper;

  buildInputs = [
    pkgs.imagemagick
    pkgs.python3
    pkgs.bc
  ];

  buildCommand = ''
    # Convertir imagen a espacio LAB y aplicar K-means clustering (3 colores)
    magick "$src" -resize 300x300 -colorspace LAB \
      -kmeans 3 -unique-colors txt:- \
      | grep -o '#[0-9A-F]\{6\}' > cluster_colors.txt

    # Obtener colores ordenados por luminosidad (LAB)
    mapfile -t cluster_colors < cluster_colors.txt

    # Función para calcular diferencia de color en LAB
    hex_to_lab() {
      magick -size 1x1 xc:"$1" -colorspace LAB -format "%[pixel:p{0,0}]" info: \
        | awk -F'[,(]' '{print $2, $3, $4}'
    }

    delta_e() {
      l1=$1; a1=$2; b1=$3
      l2=$4; a2=$5; b2=$6
      echo "sqrt(($l1 - $l2)^2 + ($a1 - $a2)^2 + ($b1 - $b2)^2)" | bc -l
    }

    # Paso 1: Seleccionar Base (color más frecuente usando histograma)
    magick "$src" -resize 100x100 -colors 256 resized.jpg
    magick resized.jpg -format "%c" histogram:info:- \
      | sort -nr | sed -n 1p | grep -o '#[0-9A-F]\{6\}' > base_color.txt
    base=$(cat base_color.txt)

    # Paso 2: Buscar Accent (mayor diferencia perceptual de la base en los clusters)
    base_lab=($(hex_to_lab "$base"))
    max_de=0
    accent=""

    for color in "''${cluster_colors[@]}"; do
      color_lab=($(hex_to_lab "$color"))
      de=$(delta_e "''${base_lab[0]}" "''${base_lab[1]}" "''${base_lab[2]}" \
                  "''${color_lab[0]}" "''${color_lab[1]}" "''${color_lab[2]}")
      if (( $(echo "$de > $max_de" | bc -l) )); then
        max_de=$de
        accent="$color"
      fi
    done

    # Paso 3: Forzar contraste mínimo si es necesario
    min_de=40  # Ajusta este valor para más/menos contraste (40 es alto)
    if (( $(echo "$max_de < $min_de" | bc -l) )); then
      # Generar complementario de la base
      hue=$(magick xc:"$base" -colorspace HSL -format "%[pixel:p{0,0}]" info: | awk -F, '{print $1*360}')
      new_hue=$(echo "($hue + 180) % 360" | bc -l)
      accent=$(magick -size 1x1 xc:"hsl($new_hue, 50%, 50%)" -colorspace RGB -format "%[hex:u]" info:)
    fi

    # Paso 4: Determinar Texto (contraste automático)
    base_lightness=$(echo "''${base_lab[0]}" | bc -l)
    if (( $(echo "$base_lightness > 50" | bc -l) )); then
      text="#000000"
      mode="light"
    else
      text="#FFFFFF"
      mode="dark"
    fi

    # Resultado final
    mkdir -p $out
    echo "{ base = \"$base\"; accent = \"$accent\"; text = \"$text\"; mode = \"$mode\"; }" > $out/colors.nix
  '';
}
