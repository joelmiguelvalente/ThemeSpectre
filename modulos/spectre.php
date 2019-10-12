<?php
/* Selección del recaptcha */
if($tsCore->settings['c_recaptcha'] == 0) {
  define('RC_PUK',$tsCore->settings['pkey']);
  define('RC_PIK',$tsCore->settings['skey']);
} else {
  define('RC_PUK',$tsCore->settings['pkey3']);
  define('RC_PIK',$tsCore->settings['skey3']);
}

define('VersionTheme', '1.0');
/* BUSQUEDA PERSONALIZADA GOOGLE */
/*
  Para obtener el código https://cse.google.com/
*/
define('keySearch', '001111159254189604141:meis1ggkldc');
/* ↑ NO ELIMINAR, PERO CAMBIEN LA CLAVE ↑ */

/* ========================== */

/* FORZAMOS EL IDIOMA ESPAÑOL */
setlocale(LC_ALL, "es_ES");

/* Para cambiar ubicación https://www.php.net/manual/es/timezones.php */
date_default_timezone_set("America/Argentina/Buenos_Aires");

define('nodeCss',   $tsCore->settings['url'] . '/modulos/css');
define('Spectrejs', $tsCore->settings['url'] . '/modulos/js/spectre.js');
define('LogoPng',   $tsCore->settings['url'] . '/modulos/img/favicon.png');
define('LogoIco',   $tsCore->settings['url'] . '/modulos/img/favicon.ico');
define('Header',   $tsCore->settings['url'] . '/modulos/img/header.webp');

$array = array(
  nodeCss . '/spectre.min.css?'.time(),
  nodeCss . '/spectre-exp.min.css?'.time(),
  nodeCss . '/spectre-icons.min.css?'.time(),
  nodeCss . '/LineIcons.min.css?'.time(),
);
define('Spectre', $array);

/* MODIFIER_KMG by KMario19 */
function smarty_modifier_kmg($number){
   $pre = 'KMG';
   if ($number >= 1000) {
       for ($i=-1; $number>=1000; ++$i) {
           $number /= 1000;
       }
       return round($number,1).$pre[$i];
   } else return $number;
}

/* NUMBER_FORMAT Smarty 2 
 * El theme no lo usa pero si agregan más modulos y estos tienen number_format, no dará problemas
*/
function smarty_modifier_number_format($string, $decimals = 0, $dec_sep=",", $thous_sep = ".") { 
   return number_format($string,$decimals,$dec_sep,$thous_sep);
} 

/* NOBBCODE by 1TSR4SC11 */
function smarty_modifier_nobbcode($nobbcode = ''){
  $nobbcode = preg_replace('/\[([^\]]*)\]/', '', $nobbcode); 
  $regex = "@(https?://([-\w\.]+[-\w])+(:\d+)?(/([\w/_\.#-]*(\?\S+)?[^\.\s])?)?)@";
  $nobbcode = preg_replace($regex, ' ', $nobbcode);
  return $nobbcode;
}