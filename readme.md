# vhs effect for video files

applies a retro vhs effect to videos using mpv and a glsl shader

## how it works

- **shader effects**:
  - adds vhs-style tracking issues and distortion
  - creates color smearing and bleeding
  - simulates analog signal degradation
  - applies screen wiggle and vertical hold issues

- **mpv configuration**:
  - forces 4:3 aspect ratio with cropping
  - applies high-quality GPU rendering
  - maintains proper scaling with panscan

## usage

```
./vhs video.mp4
```

## options

- `-f, --fullscreen`: start in fullscreen mode

## customization

in the shader file (`vhs.glsl`), you can adjust:
- `wiggle`: controls intensity of horizontal distortion (default: 3.0)
- `smear`: controls color bleeding effect (default: 0.5)

## requirements

- mpv media player
