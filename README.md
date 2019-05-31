# Unofficial TYPO3 Surf Docker image

### Description
Small, alpine based image with TYPO3 Surf pre installed.  
Based on the my [composer 1.x image with PHP 7.2](https://hub.docker.com/r/t3easy/composer).
  
### Tags:  
*  [`latest`, `beta` TYPO3 Surf latest beta](https://github.com/t3easy/docker-surf/blob/master/Dockerfile)
*  [`next`, `master` TYPO3 Surf dev-master + Node.js 10 + npm + Yarn + gulp-cli](https://github.com/t3easy/docker-surf/blob/develop/Dockerfile)
*  [`node`, `node10` TYPO3 Surf latest beta + Node.js 10 + npm + Yarn](https://github.com/t3easy/docker-surf/blob/master/Dockerfile.Node)
*  [`node6` TYPO3 Surf latest beta + Node.js 6 + npm + Yarn](https://github.com/t3easy/docker-surf/blob/master/Dockerfile.Node6)
*  [`node6-gulp`, `gulp-node6` TYPO3 Surf latest beta + Node.js 6 + npm + Yarn + gulp-cli](https://github.com/t3easy/docker-surf/blob/master/Dockerfile.Node6-Gulp)
*  [`node8` TYPO3 Surf latest beta + Node.js 8 + npm + Yarn](https://github.com/t3easy/docker-surf/blob/master/Dockerfile.Node8)
*  [`node8-gulp`, `gulp-node8` TYPO3 Surf latest beta + Node.js 8 + npm + Yarn + gulp-cli](https://github.com/t3easy/docker-surf/blob/master/Dockerfile.Node8-Gulp)
*  [`node-gulp`, `node10-gulp`, `gulp`, `gulp-node10`, `gulp-node` TYPO3 Surf latest beta + Node.js 10 + npm + Yarn + gulp-cli](https://github.com/t3easy/docker-surf/blob/master/Dockerfile.Node-Gulp)

### Obsolete tags:
* `node8.9` TYPO3 Surf + Node.js 8.9
* `gulp-node8.9` TYPO3 Surf + Node.js 8.9 + gulp-cli

### ATTENTION:
The image with `next` tag prepares for the upcoming releases of the t3easy/surf image.  
As soon as TYPO3 Surf 2.0 marked stable, the `develop` branch will be merged to `master` and the image gets tag `latest`.  
If you use this image, test your deployment and toolchain with `t3easy/surf:next`!

### Supporting
If you like this image, consider to support me:
*  https://www.patreon.com/t3easy
*  https://www.paypal.me/t3easy