<?php

require_once 'JBBCode/Parser.php';
require_once 'JBBCode/definitions/Video.php';
require_once 'JBBCode/validators/ColorValidator.php';
require_once 'JBBCode/validators/UrlValidator.php';
require_once 'JBBCode/validators/AlignValidator.php';
require_once 'JBBCode/validators/SizeValidator.php';
require_once 'JBBCode/validators/SwfValidator.php';
require_once 'JBBCode/validators/ImgValidator.php';
require_once 'JBBCode/validators/FontValidator.php';

/**
 * Clase responsable de la conversión de texto en formato
 * de marcado BBCode a XHTML para creración de contenido
 * usado en posts, fotos, comentarios, etc.
 *
 * Extiende de la clase jBBCode para facilitar el uso de
 * todas las herramientas disponibles para la conversión
 * además de su excelente seguridad para el script.
 *
 * @author Kmario19 y PHPost.
 */
class BBCode {

    /**
     * String texto BBcode
     */
    private $text;

    /**
     * BBCodes permitidos
     */
    private $restriction;

    /**
     * jBBCode
     */
    private $parser;


    public function __construct() {
        $this->restriction = array();
        $this->parser = new JBBCode\Parser();
    }

    /**
     * Prepara el texto con el que se trabajará
     *
     * @param string $text  texto a parsear
     */
    public function setText($text) {
        $this->text = $text;
        $this->unclosedTags();
    }

    /**
     * Modificar restricciones de BBCode
     *
     * @param Array string $restriccion  lista de tags permitidos
     */
    public function setRestriction($array) {
        $this->restriction = $array;

        $this->addBBcodes();
    }

    /**
     * Elimina etiquetas BBcode y deja el texto plano
     *
     * @return string
     */
    public function getAsText() {
        $this->parser->parse($this->text);

        $this->text = $this->parser->getAsText();

        $this->delExtraTags();

        return htmlspecialchars_decode(strip_tags($this->text));
    }

    /**
     * Obtiene el texto en HTML
     *
     * @return string
     */
    public function getAsHtml() {
        $this->parser->parse($this->text);

        $this->text = $this->parser->getAsHtml();

        $this->setExtraTags();

        return nl2br($this->text);
    }

    /**
     * Fix para tags que no tienen etiqueta de cierre
     * y para tags de YouTube de la versión anterior
     */
    private function unclosedTags() {
        $this->text = preg_replace("/[\.com]+\/v\//i", ".com/watch?v=", $this->text);
        $this->text = preg_replace("/\[swf=(http|https)?(\:\/\/)?www\.youtube\.com\/watch\?v([A-z0-9=\-]+?)\]/i", "[video]$1$2www.youtube.com/watch?v$3[/video]", $this->text);

        $this->text = preg_replace("/\[img\=(.+?)\]/i", "[img]$1[/img]", $this->text);
        $this->text = preg_replace("/\[swf\=(.+?)\]/i", "[swf]$1[/swf]", $this->text);

        $this->text = str_replace('&#039;', '\'', $this->text);
    }

    /**
     * Parsea tag de línea de división
     * saltos de línea
     */
    private function setExtraTags() {
        if (in_array('hr', $this->restriction)) {
            $this->text = str_replace('[hr]', '<hr />', $this->text);
        }

        $this->text = str_replace('\n', '<br />', $this->text);
    }

    /**
     * Elimina tag de línea de división
     * saltos de línea
     * espacios vacíos
     */
    private function delExtraTags() {
        $this->text = str_replace(array('[hr]', '\n', '\r'), ' ', $this->text);
        $this->text = preg_replace('!\s+!', ' ', $this->text);
        $this->text = preg_replace('/((http|https|www)[^\s]+)/', '', $this->text);
    }

    /**
     * Agrega y valida los BBcodes a parsear.
     *
     * Si el bbcode se encuentra en el array de la restricción, será permitido.
     * Si no es válido lo que se pasa por parametro o contenido se verá el bbcode
     * sin ser parseado. Ejemplo: [a]no es link[/a] => [a]no es link[/a]
     *
     * Cada bbcode tiene su configuración de:
     *
     * TagName: Nombre del tag de bbcode.
     * Replace: En qué formrato HTML se reemplazará.
     *          Usar como variables de referencia {option} y {param}.
     * UseOption: Si el tag usa parámetro ({option}).
     * ParseContent: Si el contenido del tag también será parseado.
     * NestLimit: Límite de cuantas veces se repite este tag en su contenido (incluyendose).
     * OptionValidator: Clase con la cual se valida lo que se pasa por parámetro.
     * BodyValidator: Clase con la cual se valida lo que se pasa como contenido del tag.
     */
    public function addBBcodes() {
        $urlValidator = new \JBBCode\validators\UrlValidator();
        $colorValidator = new \JBBCode\validators\ColorValidator();
        $sizeValidator = new \JBBCode\validators\SizeValidator();
        $alignValidator = new \JBBCode\validators\AlignValidator();
        $swfValidator = new \JBBCode\validators\SwfValidator();
        $imgValidator = new \JBBCode\validators\ImgValidator();
		$fontValidator = new \JBBCode\validators\FontValidator();

        $tagCodes = array(
            array('tag' => 'b', 'replace' => '<strong>{param}</strong>'),
            array('tag' => 'i', 'replace' => '<i>{param}</i>'),
            array('tag' => 'u', 'replace' => '<u>{param}</u>'),
            array('tag' => 's', 'replace' => '<s>{param}</s>'),
            array('tag' => 'sub', 'replace' => '<sub>{param}</sub>'),
            array('tag' => 'sup', 'replace' => '<sup>{param}</sup>'),
            array('tag' => 'table', 'replace' => '<table class="bbctab"><tbody>{param}</tbody></table>'),
            array('tag' => 'tr', 'replace' => '<tr>{param}</tr>'),
            array('tag' => 'td', 'replace' => '<td>{param}</td>'),
            array('tag' => 'ul', 'replace' => '<ul>{param}</ul>'),
            array('tag' => 'li', 'replace' => '<li>{param}</li>'),
            array('tag' => 'ol', 'replace' => '<ol>{param}</ol>'),
            array('tag' => 'url', 'replace' => '<a href="{param}" target="_blank">{param}</a>', 'parse' => false, 'validParam' => $urlValidator),
            array('tag' => 'url', 'replace' => '<a href="{option}" target="_blank">{param}</a>', 'option' => true, 'validOption' => $urlValidator),
            array('tag' => 'img', 'replace' => '<img src="{param}" class="img_smart"/>', 'parse' => false, 'validParam' => $imgValidator),
            array('tag' => 'color', 'replace' => '<span style="color: {option}">{param}</span>', 'option' => true, 'validOption' => $colorValidator),
            array('tag' => 'size', 'replace' => '<span style="font-size: {option}pt; line-height: {option}pt">{param}</span>', 'option' => true, 'validOption' => $sizeValidator),
            array('tag' => 'align', 'replace' => '<div style="text-align: {option}">{param}</div>', 'option' => true, 'validOption' => $alignValidator),
            array('tag' => 'font', 'replace' => '<span style="font-family: {option}">{param}</span>', 'option' => true, 'validOption' =>$fontValidator),
            array('tag' => 'code', 'replace' => '<pre class="code">{param}</pre>', 'parse' => false, 'limit' => 1),
            array('tag' => 'swf', 'replace' => '<iframe width="640px" height="390px" src="{param}?controls=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>', 'parse' => false, 'validParam' => $swfValidator),
            array('tag' => 'spoiler', 'replace' => '<div class="spoiler"><div class="title"><a href="#" onclick="spoiler($(this)); return false;">Spoiler:</a></div><div class="body">{param}</div></div>'),
            array('tag' => 'quote', 'replace' => '<blockquote class="modern-quote full"><p>{param}</p></blockquote>'),
            array('tag' => 'quote', 'replace' => '<blockquote class="modern-quote-comment"><p>{param}</p><p><cite>{option}</cite></p></blockquote>', 'option' => true),
            array('tag' => 'notice', 'replace' => '<div class="bbcmsg notice">{param}</div>'),
            array('tag' => 'info', 'replace' => '<div class="bbcmsg info">{param}</div>'),
            array('tag' => 'warning', 'replace' => '<div class="bbcmsg warning">{param}</div>'),
            array('tag' => 'error', 'replace' => '<div class="bbcmsg error">{param}</div>'),
            array('tag' => 'success', 'replace' => '<div class="bbcmsg success">{param}</div>')
        );

        foreach ($tagCodes as $bbcode) {
            if (in_array($bbcode['tag'], $this->restriction) || !$this->restriction) {
                $tag = $bbcode['tag'];
                $replace = $bbcode['replace'];
                $option = isset($bbcode['option']) ? $bbcode['option'] : false;
                $parse = isset($bbcode['parse']) ? $bbcode['parse'] : true;
                $limit = isset($bbcode['limit']) ? $bbcode['limit'] : -1;
                $validOption = isset($bbcode['validOption']) ? $bbcode['validOption'] : null;
                $validParam = isset($bbcode['validParam']) ? $bbcode['validParam'] : null;

                $this->parser->addBBCode($tag, $replace, $option, $parse, $limit, $validOption, $validParam);
            }
        }
        // Tag de video independiente
        if (in_array('video', $this->restriction) || !$this->restriction) {
            $this->parser->addCodeDefinition(new Video());
        }
    }
    
    /**
     * @name parseMentions
     * @access public
     * @param string
     * @return string
     * @info PONE LOS LINKS A LOS MENCIONADOS
     */
    public function parseMentions() {
        global $tsUser;

        $founds = array();

        $this->text .= ' ';

        preg_match_all('/\B@([a-zA-Z0-9_-]{4,16}+)\b/', $this->text, $users);

        foreach ($users[1] as $user) {
            if (!in_array($user, $founds)) {
                $uid = $tsUser->getUserID($user);
                if (!empty($uid)) {
                    $find = '@' . $user . ' ';
                    $replace = '@<a href="' . $this->settings['url'] . '/perfil/' . $user . '" class="hovercard" uid="' . $uid . '">' . $user . '</a> ';
                    $this->text = str_replace($find, $replace, $this->text);
                }
                $founds[] = $user;
            }
        }

        $this->text = substr($this->text, 0, -1);
    }
    
    /**
     * @name parseSmiles()
     * @access public
     * @description Convierte los Smiles
     */
	public function parseSmiles(){
       global $tsCore;
        // SMILEYS
        $bbcode = array();
        $html = array();
        //
        //FIX - MODIFICACION PARA QUE TOME LOS EMOTICONES DEL TEMA QUE ESTA EN USO
        $pre = '<span>&#';
        $end = ';</span>';
        // SMILES DEFAULT
        $bbcode[] = ":riendo:"; $html[] = $pre."128512".$end;
        $bbcode[] = ":sonriendo:"; $html[] = $pre."128513".$end;
        $bbcode[] = ":carcajada:"; $html[] = $pre."128514".$end;
        $bbcode[] = ":sonrisa:"; $html[] = $pre."128515".$end;
        $bbcode[] = ":risa:"; $html[] = $pre."128516".$end;
        $bbcode[] = ":risa_sudorosa:"; $html[] = $pre."128517".$end;
        $bbcode[] = ":super_risa:"; $html[] = $pre."128518".$end;
        $bbcode[] = ":santito:"; $html[] = $pre."128519".$end;
        $bbcode[] = ":diabolico:"; $html[] = $pre."128520".$end;
        $bbcode[] = ":cara_ganadora:"; $html[] = $pre."128521".$end;
        $bbcode[] = ":sonrojado:"; $html[] = $pre."128522".$end;
        $bbcode[] = ":legua_fuera:"; $html[] = $pre."128523".$end;
        $bbcode[] = ":cara_relievada:"; $html[] = $pre."128524".$end;
        $bbcode[] = ":enamorado:"; $html[] = $pre."128525".$end;
        $bbcode[] = ":cheto:"; $html[] = $pre."128526".$end;
        $bbcode[] = ":cara_sonriente:"; $html[] = $pre."128527".$end;
        $bbcode[] = ":neutro:"; $html[] = $pre."128528".$end;
        $bbcode[] = ":sin_expresion:"; $html[] = $pre."128529".$end;
        $bbcode[] = ":sin_justificacion:"; $html[] = $pre."128530".$end;
        $bbcode[] = ":sudando:"; $html[] = $pre."128531".$end;
        $bbcode[] = ":pensativo:"; $html[] = $pre."128532".$end;
        $bbcode[] = ":confuso:"; $html[] = $pre."128533".$end;
        $bbcode[] = ":confundido:"; $html[] = $pre."128534".$end;
        $bbcode[] = ":tirando_besos1:"; $html[] = $pre."128535".$end;
        $bbcode[] = ":tirando_besos2:"; $html[] = $pre."128536".$end;
        $bbcode[] = ":tirando_besos3:"; $html[] = $pre."128537".$end;
        $bbcode[] = ":tirando_besos4:"; $html[] = $pre."128538".$end;
        $bbcode[] = ":lengua_extendida:"; $html[] = $pre."128539".$end;
        $bbcode[] = ":lengua_gana:"; $html[] = $pre."128540".$end;
        $bbcode[] = ":lengua_cerrada:"; $html[] = $pre."128541".$end;
        $bbcode[] = ":desepcionado:"; $html[] = $pre."128542".$end;
        $bbcode[] = ":preocupado:"; $html[] = $pre."128543".$end;
        $bbcode[] = ":enojado:"; $html[] = $pre."128544".$end;
        $bbcode[] = ":putado:"; $html[] = $pre."128545".$end;
        $bbcode[] = ":llorando:"; $html[] = $pre."128546".$end;
        $bbcode[] = ":perseverante:"; $html[] = $pre."128547".$end;
        $bbcode[] = ":triump:"; $html[] = $pre."128548".$end;
        $bbcode[] = ":desepcion_aliviado:"; $html[] = $pre."128549".$end;
        $bbcode[] = ":boquiabierta:"; $html[] = $pre."128550".$end;
        $bbcode[] = ":angustiado:"; $html[] = $pre."128551".$end;
        $bbcode[] = ":temeroso:"; $html[] = $pre."128552".$end;
        $bbcode[] = ":somnoliento:"; $html[] = $pre."128553".$end;
        $bbcode[] = ":cansado:"; $html[] = $pre."128554".$end;
        $bbcode[] = ":cansado2:"; $html[] = $pre."128555".$end;
        $bbcode[] = ":grimacante:"; $html[] = $pre."128556".$end;
        $bbcode[] = ":lloroso:"; $html[] = $pre."128557".$end;
        $bbcode[] = ":asombro:"; $html[] = $pre."128558".$end;
        $bbcode[] = ":empujada:"; $html[] = $pre."128559".$end;
        $bbcode[] = ":temeroso_sudor:"; $html[] = $pre."128560".$end;
        $bbcode[] = ":asustado:"; $html[] = $pre."128561".$end;
        $bbcode[] = ":atonito:"; $html[] = $pre."128562".$end;
        $bbcode[] = ":cara_sonrojado:"; $html[] = $pre."128563".$end;
        $bbcode[] = ":durmiendo:"; $html[] = $pre."128564".$end;
        $bbcode[] = ":mareado:"; $html[] = $pre."128565".$end;
        $bbcode[] = ":sin_boca:"; $html[] = $pre."128566".$end;
        $bbcode[] = ":medico_temeroso:"; $html[] = $pre."128567".$end;
        $bbcode[] = ":slight_frown:"; $html[] = $pre."128577".$end;
        $bbcode[] = ":slight_smile:"; $html[] = $pre."128578".$end;
        $bbcode[] = ":upside_down:"; $html[] = $pre."128579".$end;
        $bbcode[] = ":rolling_eyes:"; $html[] = $pre."128580".$end;
        $bbcode[] = ":zipper_mouth:"; $html[] = $pre."129296".$end;
        $bbcode[] = ":money_mouth:"; $html[] = $pre."129297".$end;
        $bbcode[] = ":thermometer_face:"; $html[] = $pre."129298".$end;
        $bbcode[] = ":nerd:"; $html[] = $pre."129299".$end;
        $bbcode[] = ":thinking:"; $html[] = $pre."129300".$end;
        $bbcode[] = ":head_bandage:"; $html[] = $pre."129301".$end;
        $bbcode[] = ":cowboy:"; $html[] = $pre."129312".$end;
        $bbcode[] = ":clown:"; $html[] = $pre."129313".$end;
        $bbcode[] = ":nauseated_face:"; $html[] = $pre."129314".$end;
        $bbcode[] = ":carcajada2:"; $html[] = $pre."129315".$end;
        $bbcode[] = ":drooling_face:"; $html[] = $pre."129316".$end;
        $bbcode[] = ":lying_face:"; $html[] = $pre."129317".$end;
        $bbcode[] = ":sneezing_face:"; $html[] = $pre."129319".$end;
        $bbcode[] = ":ceja_levantada:"; $html[] = $pre."129320".$end;
        $bbcode[] = ":estrella:"; $html[] = $pre."129321".$end;
        $bbcode[] = ":loco:"; $html[] = $pre."129322".$end;
        $bbcode[] = ":shuuu:"; $html[] = $pre."129323".$end;
        $bbcode[] = ":enfadado:"; $html[] = $pre."129324".$end;
        $bbcode[] = ":picardia:"; $html[] = $pre."129325".$end;
        $bbcode[] = ":vomito:"; $html[] = $pre."129326".$end;
        $bbcode[] = ":bum:"; $html[] = $pre."129327".$end;
        $bbcode[] = ":rico:"; $html[] = $pre."129488".$end;

        // REEMPLAZAMOS SMILEYS
        $this->text = str_replace($bbcode, $html, $this->text);
    }    
}
