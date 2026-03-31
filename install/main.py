import subprocess

from pkg import std_pkg
from pkg import home_and_work_pkg
from pkg import work_pkg
from services import services


def full_update() -> None:
    try:
        subprocess.run(
            [
                'sudo',
                'reflector',
                '--latest',
                '20', 
                '--age', 
                '12', 
                '--protocol',
                'https',
                '--sort',
                'rate',
                '--save',
                '/etc/pacman.d/mirrorlist'
            ],
            check=True,
            capture_output=True,
            text=True
        )
        subprocess.run(
            [
                'sudo',
                'pacman',
                '-Syyu',
                '--noconfirm',
            ],
            check=True,
            capture_output=True,
            text=True
        )
        result = 0
    except Exception as e:
        result = 1

    if result != 0:
        print('upt FAILED')
    else:
        print('upt OK')

def install_pkg(pkgs: list) -> None:
    for pkg in pkgs:
        try:
            subprocess.run(
                ['sudo', 'pacman', '-S', f'{pkg}', '--noconfirm'],
                check=True,
                capture_output=True,
                text=True
            )
            result = 0
        except Exception as e:
            result = 1

        if result != 0:
            print(f'pkg FAILED: {pkg}')
        else:
            print(f'pkg OK: {pkg}')


def service_enable_and_start(services: list) -> None:
     for srv in services:
        try:
            subprocess.run(
                ['systemctl', '--user', 'enable', f'{srv}'],
                check=True,
                capture_output=True,
                text=True
            )
            result = 0
        except Exception as e:
            result = 1

        if result != 0:
            print(f'srv FAILED: {srv}')
        else:
            print(f'srv OK: {srv}')


def main():
    install_pkg(std_pkg)
    service_enable_and_start(services)
    full_update()

    # home_and_work
    install_pkg(home_and_work_pkg)

    # wok
    install_pkg(work_pkg)

if __name__ == '__main__':
    main()
