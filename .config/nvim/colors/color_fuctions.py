import numpy as np

def interpolate(start: int, end: int, alpha: float) -> float:
    return (1 - alpha) * start + alpha * end

def hex_to_rgb(hex_code: str) -> np.ndarray:
    hex_part = hex_code[1:]
    if len(hex_part) == 3:
        hex_part = "".join([2 * c for c in hex_part])
    return np.array([int(hex_part[i : i + 2], 16) / 255 for i in range(0, 6, 2)])

def rgb_to_hex(rgb: tuple[float]) -> str:
    return "#" + "".join("%02x" % int(255 * x) for x in rgb)

def interpolate_color(color1, color2, alpha: float):
    rgb = interpolate(hex_to_rgb(color1), hex_to_rgb(color2), alpha)
    return rgb_to_hex(rgb)

