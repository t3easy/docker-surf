# Unofficial TYPO3 Surf Docker image

### Description
Small, alpine based image with TYPO3 Surf preinstalled.  
Based on my [composer image](https://hub.docker.com/r/t3easy/composer).
  
### Tag structure:
t3easy/surf:$SURF_VERSION-php$PHP_VERSION-composer$COMPOSER_VERSION-node$NODE_VERSION
Example: t3easy/surf:2-php7.4-composer2-node14

### ATTENTION:
The image with `next` tag prepares for the upcoming releases of the t3easy/surf image.  
As soon as TYPO3 Surf 2.0 marked stable, the `develop` branch will be merged to `master` and the image gets tag `latest`.  
If you use this image, test your deployment and toolchain with `t3easy/surf:next`!

### Supporting
If you like this image, consider to support me:
*  https://www.patreon.com/t3easy
*  https://www.paypal.me/t3easy