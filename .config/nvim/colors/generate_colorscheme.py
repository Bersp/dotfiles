from color_fuctions import interpolate_color

COLOR_NAME = 'yerba'

# COLORS = {
# 'BLACK': '#2e3440',
# 'DARKEST_GRAY': '#3B4252',
# 'DARKER_GRAY': '#434C5E',
# 'DARK_GRAY': '#4C566A',
# 'GRAY': '#616e88',
# 'LIGHT_GRAY': '#D8DEE9',
# 'LIGHTER_GRAY': '#E5E9F0',
# 'WHITE': '#ECEFF4',
# 'AQUA': '#8FBCBB',
# 'LIGHTER_BLUE': '#88C0D0', # secondary color
# 'LIGHT_BLUE': '#81A1C1', # primary color
# 'BLUE': '#5E81AC',
# 'RED': '#BF616A',
# 'ORANGE': '#D08770',
# 'YELLOW': '#EBCB8B',
# 'GREEN': '#A3BE8C',
# 'VIOLET': '#B48EAD'
# }

RED = '#D15662'
YELLOW = '#EBCB8B'
ORANGE = '#D89216'
BLUE = '#3E88D8'
VIOLET = '#E1B0C5'

D_YELLOW = ORANGE

WOOD = '#919888'

B_GREEN = '#92D188'
GREEN = '#79a972'
D_GREEN = '#50936A'
AQUA = '#92D1AF'

BLACK = '#2e3940'
WHITE = '#EFFDF3'

GRAY = interpolate_color(B_GREEN, BLACK, 0.7)#'#616e88'
DARKER_GRAY = interpolate_color(B_GREEN, BLACK, 0.95)

# ----------------------------------------------------------------------
# Yerba
COLORS = {
    'BG': BLACK,

    'DARKEST_GRAY': DARKER_GRAY, # cursor line
    'DARKER_GRAY': DARKER_GRAY, 
    'DARK_GRAY': GRAY,

    'COMMENT': GRAY,

    'LIGHT_GRAY': WHITE,
    'LIGHTER_GRAY': WHITE,
    'WHITE': WHITE,

    'ACCENT': WOOD,
    'ACCENT_LIGHT': B_GREEN,

    'ACCENT_STRONG': '#FFEBCD',

    'ACCENT_SOFT': AQUA,
    'ACCENT_DARK': AQUA,

    'NUMBER': '#D9CAB3',

    'HIGH_WARNING': RED,
    'LOW_WARNING': YELLOW,
    'ANNOTATION': ORANGE,
    'STRING': YELLOW,
}

# ----------------------------------------------------------------------
# Everforest

# BLACK = '#2b3339'
# DARKEST_GRAY = '#323c41'
# DARKER_GRAY = '#445055'
# GRAY = '#53605c'
# DARKER_GRAY = '#3a454a'
# GRAY = '#7a8478'
# LIGHTHER_GRAY = '#859289'
# LIGHT_GRAY = '#9da9a0'
# WHITE = '#d3c6aa'

# RED = '#E67E80'
# ORANGE = '#E69875'
# YELLOW = '#DBBC7F'
# GREEN = '#A7C080'
# AQUA = '#83C092'
# BLUE = '#7FBBB3'
# PURPLE = '#D699B6'

# COLORS = {
    # 'BG': BLACK,

    # 'DARKEST_GRAY': DARKER_GRAY, # cursor line
    # 'DARKER_GRAY': DARKER_GRAY, 
    # 'DARK_GRAY': GRAY,

    # 'COMMENT': GRAY,

    # 'LIGHT_GRAY': WHITE,
    # 'LIGHTER_GRAY': WHITE,
    # 'WHITE': WHITE,

    # 'ACCENT': RED,
    # 'ACCENT_LIGHT': GREEN,

    # 'ACCENT_STRONG': ORANGE,

    # 'ACCENT_SOFT': AQUA,
    # 'ACCENT_DARK': AQUA,

    # 'NUMBER': PURPLE,

    # 'HIGH_WARNING': RED,
    # 'LOW_WARNING': YELLOW,
    # 'ANNOTATION': ORANGE,
    # 'STRING': AQUA,
# }

with open('template.vim', 'r') as f:
    c_file = f.readlines()

for i in range(len(c_file)):
    c_file[i] = c_file[i].replace('COLOR_NAME', COLOR_NAME)
    for label, color in COLORS.items():
        c_file[i] = c_file[i].replace(f'__{label}__', color.lower())

with open(f'{COLOR_NAME}.vim', 'w') as f:
    f.writelines(c_file)
