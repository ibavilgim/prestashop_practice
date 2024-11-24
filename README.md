# How to install PrestaShop

First of all, you need to download this repository to the device you want to configure.

Then, you have to give execution permissions to all scripts in the `scripts` folder.

### Steps:

1. Execute `install_lamp.sh`:
    ```sh
    sudo ./install_lamp.sh
    ```

2. Execute `install_phpmyadmin.sh`:
    ```sh
    sudo ./install_phpmyadmin.sh
    ```

3. Execute `setup_https.sh`:
    ```sh
    sudo ./setup_https.sh
    ```

4. Execute `deploy_prestashop.sh`:
    ```sh
    sudo ./deploy_prestashop.sh
    ```

Make sure you have the necessary permissions and configurations before running these scripts.
