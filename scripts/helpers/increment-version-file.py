import sys
from pathlib import Path
from semantic_version import Version

# Assume this script is called from the root directory

version_path = Path('src/resources/version.txt')
v = Version(version_path.read_text())

increment_type = sys.argv[1]
if increment_type == 'major':
    v = v.next_major()
elif increment_type == 'minor':
    v = v.next_minor()
elif increment_type == 'patch':
    v = v.next_patch()
else:
    raise ValueError(f'Increment type should be "major", "minor", or '
                     f'"patch", but was {increment_type}')

version_path.write_text(str(v))
