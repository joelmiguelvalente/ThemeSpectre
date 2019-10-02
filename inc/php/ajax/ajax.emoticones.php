<?php if ( ! defined('TS_HEADER')) exit('No se permite el acceso directo al script');
/**
 * Controlador AJAX
 *
 * @name    ajax.emoticones.php
 * @author  PHPost Team
*/
/**********************************\

*	(VARIABLES POR DEFAULT)		*

\*********************************/

	// NIVELES DE ACCESO Y PLANTILLAS DE CADA ACCIÓN
	$files = array(
		'emoticonos' => array('n' => 2, 'p' => ''),
	);

/**********************************\

* (VARIABLES LOCALES ESTE ARCHIVO)	*

\*********************************/

	// REDEFINIR VARIABLES
	$tsPage = 'php_files/p.emoticonos.'.$files[$action]['p'];
	$tsLevel = $files[$action]['n'];
	$tsAjax = empty($files[$action]['p']) ? 1 : 0;

/**********************************\

*	(INSTRUCCIONES DE CODIGO)		*

\*********************************/
	
	// DEPENDE EL NIVEL
	$tsLevelMsg = $tsCore->setLevel($tsLevel, true);
	if($tsLevelMsg != 1) { echo '0: '.$tsLevelMsg['mensaje']; die();}
	// HTML
    $emoticones = array(
        array(":riendo:", "128512"),
        array(":sonriendo:", "128513"),
        array(":carcajada:", "128514"),
        array(":sonrisa:", "128515"),
        array(":risa:", "128516"),
        array(":risa_sudorosa:", "128517"),
        array(":super_risa:", "128518"),
        array(":santito:", "128519"),
        array(":diabolico:", "128520"),
        array(":cara_ganadora:", "128521"),
        array(":sonrojado:", "128522"),
        array(":legua_fuera:", "128523"),
        array(":cara_relievada:", "128524"),
        array(":enamorado:", "128525"),
        array(":cheto:", "128526"),
        array(":cara_sonriente:", "128527"),
        array(":neutro:", "128528"),
        array(":sin_expresion:", "128529"),
        array(":sin_justificacion:", "128530"),
        array(":sudando:", "128531"),
        array(":pensativo:", "128532"),
        array(":confuso:", "128533"),
        array(":confundido:", "128534"),
        array(":tirando_besos1:", "128535"),
        array(":tirando_besos2:", "128536"),
        array(":tirando_besos3:", "128537"),
        array(":tirando_besos4:", "128538"),
        array(":lengua_extendida:", "128539"),
        array(":lengua_gana:", "128540"),
        array(":lengua_cerrada:", "128541"),
        array(":desepcionado:", "128542"),
        array(":preocupado:", "128543"),
        array(":enojado:", "128544"),
        array(":putado:", "128545"),
        array(":llorando:", "128546"),
        array(":perseverante:", "128547"),
        array(":triump:", "128548"),
        array(":desepcion_aliviado:", "128549"),
        array(":boquiabierta:", "128550"),
        array(":angustiado:", "128551"),
        array(":temeroso:", "128552"),
        array(":somnoliento:", "128553"),
        array(":cansado:", "128554"),
        array(":cansado2:", "128555"),
        array(":grimacante:", "128556"),
        array(":lloroso:", "128557"),
        array(":asombro:", "128558"),
        array(":empujada:", "128559"),
        array(":temeroso_sudor:", "128560"),
        array(":asustado:", "128561"),
        array(":atonito:", "128562"),
        array(":cara_sonrojado:", "128563"),
        array(":durmiendo:", "128564"),
        array(":mareado:", "128565"),
        array(":sin_boca:", "128566"),
        array(":medico_temeroso:", "128567"),
        array(":slight_frown:", "128577"),
        array(":slight_smile:", "128578"),
        array(":upside_down:", "128579"),
        array(":rolling_eyes:", "128580"),
        array(":zipper_mouth:", "129296"),
        array(":money_mouth:", "129297"),
        array(":thermometer_face:", "129298"),
        array(":nerd:", "129299"),
        array(":thinking:", "129300"),
        array(":head_bandage:", "129301"),
        array(":cowboy:", "129312"),
        array(":clown:", "129313"),
        array(":nauseated_face:", "129314"),
        array(":carcajada2:", "129315"),
        array(":drooling_face:", "129316"),
        array(":lying_face:", "129317"),
        array(":sneezing_face:", "129319"),
        array(":ceja_levantada:", "129320"),
        array(":estrella:", "129321"),
        array(":loco:", "129322"),
        array(":shuuu:", "129323"),
        array(":enfadado:", "129324"),
        array(":picardia:", "129325"),
        array(":vomito:", "129326"),
        array(":bum:", "129327"),
        array(":rico:", "129488")
	);
    // 
    foreach($emoticones as $key => $emo){
        echo '<a smile="'.$emo[0].'" href="#"><span>&#'.$emo[1].'";</span></a>';
    }
?>