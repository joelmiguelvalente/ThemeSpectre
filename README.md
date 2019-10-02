# Documentación :D

Creado con Spectre 0.5.8

## Spectre:
Me mate con el nombre XD, simplemente lo llame como el framework css del mismo nombre. 
Es un framework que esta en desarrollo, pero por el momento no utilizaremos todos los 
componentes.

`Spectre -> Smarty 3.1.31 | Jquery 3.4.1 | Php 7+ `

El theme esta compuesto por:
``` HTML
Modulos -
	|-- css
		|-- LineIcons.min.css
		|-- spectre-exp.min.css
		|-- spectre-icons.min.css
		|-- spectre.min.css
	|-- fonts
		|-- Acme-Regular.woff2
		|-- LineIcons.eot
		|-- LineIcons.svg
		|-- LineIcons.ttf
		|-- LineIcons.woff
	|-- img
		|-- favicon.ico
		|-- favicon.png
		|-- header.png
		|-- spectre-logo.png
	|-- js
		|-- spectre.js
	-- spectre.php
```

* [Spectre Framework](https://picturepan2.github.io/spectre/index.html)
* [Spectre Icons 36 Iconos](https://picturepan2.github.io/icons.css/)
* [LineIcons 460 Iconos](https://lineicons.com/icons/)

CAPTURA:

DEMO:
Usuario:   __Demo__
Contraseña: __demouser__

Ejecutar consultas:
``` SQL
ALTER TABLE `w_configuracion` ADD `c_recaptcha` int(1) NOT NULL DEFAULT '0';
ALTER TABLE `w_configuracion` ADD `pkey3` varchar(55) NOT NULL;
ALTER TABLE `w_configuracion` ADD `skey3` varchar(55) NOT NULL;
```

Editar __header.php__
Buscan estas líneas
``` PHP
    // Mensajes
    $smarty->assign('tsMPs',$tsMP->mensajes);
```
y debajo pegan esta
``` PHP
    include 'modulos/spectre.php';
```

Va a existir 2 versiones
1 - Si comienzan desde cero *tendrá los Smiles en formato texto* sin Emoticones
2 - Si ya es una web con datos *tendrá los Emoticones por defectos* sin Smiles

Si ya tienen una web hagan este paso:
Buscar en __config.inc.php__ y borran esto
``` PHP
define('RC_PUK',"6LcXvL0SAAAAAPJkBrro96lnXGZ56TBRExEmVM3L"); // public key recaptcha
define('RC_PIK',"6LcXvL0SAAAAAEg1zizOxJPTjlD0ZtbbzubF2NjE"); // private key recaptcha
```
