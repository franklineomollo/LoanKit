<?php require_once('Connections/connect.php'); ?>
<?php
if (!function_exists("GetSQLValueString")) {
function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "") 
{
  if (PHP_VERSION < 6) {
    $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;
  }

  $theValue = function_exists("mysql_real_escape_string") ? mysql_real_escape_string($theValue) : mysql_escape_string($theValue);

  switch ($theType) {
    case "text":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;    
    case "long":
    case "int":
      $theValue = ($theValue != "") ? intval($theValue) : "NULL";
      break;
    case "double":
      $theValue = ($theValue != "") ? doubleval($theValue) : "NULL";
      break;
    case "date":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;
    case "defined":
      $theValue = ($theValue != "") ? $theDefinedValue : $theNotDefinedValue;
      break;
  }
  return $theValue;
}
}

$editFormAction = $_SERVER['PHP_SELF'];
if (isset($_SERVER['QUERY_STRING'])) {
  $editFormAction .= "?" . htmlentities($_SERVER['QUERY_STRING']);
}

if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "form")) {
  $insertSQL = sprintf("INSERT INTO users (user_id, password, rpt_password, rights) VALUES (%s, %s, %s, %s)",
                       GetSQLValueString($_POST['user_id'], "int"),
                       GetSQLValueString($_POST['password'], "text"),
                       GetSQLValueString($_POST['rpt_password'], "text"),
                       GetSQLValueString($_POST['rights'], "text"));

  mysql_select_db($database_connect, $connect);
  $Result1 = mysql_query($insertSQL, $connect) or die(mysql_error());
}
						
if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "form")) {
  $insertSQL = sprintf("INSERT INTO user_details (user_id, name, phone, street, gender, city, country, region, bdate, bmonth, byear, nationality, uploadedimage) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                       GetSQLValueString($_POST['user_id'], "int"),
                       GetSQLValueString($_POST['name'], "text"),
                       GetSQLValueString($_POST['phone'], "int"),
                       GetSQLValueString($_POST['street'], "text"),
                       GetSQLValueString($_POST['gender'], "text"),
                       GetSQLValueString($_POST['city'], "text"),
                       GetSQLValueString($_POST['country'], "text"),
                       GetSQLValueString($_POST['region'], "text"),
                       GetSQLValueString($_POST['bdate'], "int"),
                       GetSQLValueString($_POST['bmonth'], "text"),
                       GetSQLValueString($_POST['byear'], "int"),
                       GetSQLValueString($_POST['nationality'], "text"),
                       GetSQLValueString($_POST['uploadedimage'], "text"));
			
			include ('saveimg.php');
					

  mysql_select_db($database_connect, $connect);
  $Result1 = mysql_query($insertSQL, $connect) or die(mysql_error());

  $insertGoTo = "profile.php";
  if (isset($_SERVER['QUERY_STRING'])) {
    $insertGoTo .= (strpos($insertGoTo, '?')) ? "&" : "?";
    $insertGoTo .= $_SERVER['QUERY_STRING'];
  }
  header(sprintf("Location: %s", $insertGoTo));
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>ASL Registration</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="stylesheet" type="text/css" href="css/default.css"/>
    </head>
    <body>    
        <form method="POST" name="form" action="<?php echo $editFormAction; ?><?php echo $editFormAction; ?>" class="register">
            <h1>Registration</h1>
            <fieldset class="row1">
                <legend>Account Details
                </legend>
                <p>
                    <label>ID Number *
                    </label>
                    <input type="text" name="user_id" id="user_id" required="required"/>
                    <input type="hidden" name="rights" id="rights" value="Member" readonly="readonly"/>
                </p>
                <p>
                    <label>Password*
                    </label>
                    <input type="password" name="password" id="password"/>
                    <label>Repeat Password*
                    </label>
                    <input type="password" name="rpt_password" id="rpt_password"/>
                    <label class="obinfo">* obligatory fields
                    </label>
                </p>
            </fieldset>
            <fieldset class="row2">
                <legend>Personal Details
                </legend>
              <p>
                    <label>Name *
                    </label>
                    <input type="text" class="long" name="name" id="name" required="required"/>
                </p>
                <p>
                    <label>Phone *
                    </label>
                    <input type="text" maxlength="15"  name="phone" id="name" required="required"/>
                </p>
                <p>
                    <label class="optional">Street
                    </label>
                    <input type="text" class="long" name="street" id="street"/>
                </p>
                <p>
                    <label>City *
                    </label>
                    <input type="text" class="long" name="city" id="city"/>
                </p>
                <p>
                    <label>Country *
                    </label>
                    <select name="country" id="name">
                        <option value="0">
                        </option>
                        <option value="Kenya">Kenya
                      </option>
                        
                        <option value="Uganda">Uganda
                        </option>
                        
                        <option value="Tanzania">Tanzani
                        </option>
                       
                        <option value="Rwanda">Rwanda
                        </option>
                       
                        <option value="Burundi">Burundi
                        </option>
                        
                        <option value="Sudan">Sudan
                        </option>
                       
                        <option value="Ethiopia">Ethiopia
                        </option>
                        
                        <option value="Eritrea">Eritrea
                        </option>
                       
                        <option value="Malawia">Malawia
                        </option>
                        
                        <option value="Somalia">Somalia
                        </option>
                       
                        <option value="Zimbabwe">Zimbabwe
                        </option>
                       
                        <option value="Zambia">Zambia
                        </option>
                        <option value="Other">Other
                        </option>
                    </select>
                </p>
              <p>
                    <label class="optional">Region
                    </label>
                <input class="long" type="text" name="region" id="region"/>
              </p>
              <p>
                    <label class="optional">Profile Image
                    </label>
                    <input name="uploadedimage" id="uploadedimage" type="file" />
              </p>
              <p>&nbsp;</p>
            </fieldset>
            <fieldset class="row3">
                <legend>Further Information
                </legend>
                <p>
                    <label>Gender *</label>
                    <input type="radio" value="male" id="gender" name="gender"/>
                    <label class="gender"  >Male</label>
                    <input type="radio" value="radio" value="female" id="gender" name="gender"/>
                    <label class="gender">Female</label>
                </p>
                <p>
                    <label>Birthdate *
                    </label>
                    <select class="date" name="bdate" id="bdate">
                        <option value="1">01
                        </option>
                        <option value="2">02
                        </option>
                        <option value="3">03
                        </option>
                        <option value="4">04
                        </option>
                        <option value="5">05
                        </option>
                        <option value="6">06
                        </option>
                        <option value="7">07
                        </option>
                        <option value="8">08
                        </option>
                        <option value="9">09
                        </option>
                        <option value="10">10
                        </option>
                        <option value="11">11
                        </option>
                        <option value="12">12
                        </option>
                        <option value="13">13
                        </option>
                        <option value="14">14
                        </option>
                        <option value="15">15
                        </option>
                        <option value="16">16
                        </option>
                        <option value="17">17
                        </option>
                        <option value="18">18
                        </option>
                        <option value="19">19
                        </option>
                        <option value="20">20
                        </option>
                        <option value="21">21
                        </option>
                        <option value="22">22
                        </option>
                        <option value="23">23
                        </option>
                        <option value="24">24
                        </option>
                        <option value="25">25
                        </option>
                        <option value="26">26
                        </option>
                        <option value="27">27
                        </option>
                        <option value="28">28
                        </option>
                        <option value="29">29
                        </option>
                        <option value="30">30
                        </option>
                        <option value="31">31
                        </option>
                    </select>
                    <select name="bmonth" id="bmonth">
                        <option value="1">January
                        </option>
                        <option value="2">February
                        </option>
                        <option value="3">March
                        </option>
                        <option value="4">April
                        </option>
                        <option value="5">May
                        </option>
                        <option value="6">June
                        </option>
                        <option value="7">July
                        </option>
                        <option value="8">August
                        </option>
                        <option value="9">September
                        </option>
                        <option value="10">October
                        </option>
                        <option value="11">November
                        </option>
                        <option value="12">December
                        </option>
                    </select>
                    <input class="year" type="text" size="4" maxlength="4" name="byear" id="byear"/>e.g 1976
                </p>
                <p>
                    <label>Nationality *
                    </label>
                    <select name="nationality" id="nationality">
                        <option value="0">
                        </option>
                        <option value="Kenyan">Kenyan
                      </option>
                        
                        <option value="Ugandan">Ugandan
                        </option>
                        
                        <option value="Tanzanian">Tanzanian
                        </option>
                       
                        <option value="Rwandese">Rwandese
                        </option>
                       
                        <option value="Burundian">Burundian
                        </option>
                        
                        <option value="Sudanese">Sudanese
                        </option>
                       
                        <option value="Ethiopian">Ethiopian
                        </option>
                        
                        <option value="Eritrean">Eritrean
                        </option>
                       
                        <option value="Malawian">Malawian
                        </option>
                        
                        <option value="Somalian">Somalian
                        </option>
                       
                        <option value="Zimbabwe">Zimbabwe
                        </option>
                       
                        <option value="Zambian">Zambian
                        </option>
                        <option value="Other">Other
                        </option>
                    </select>
                </p>
                <div class="infobox">
                  <h4>NOTE</h4>
                    <p>Your personal information shall not be shared with anyone for any reasons without your conscent.</p>
                </div>
            </fieldset>
            <fieldset class="row4">
              <legend>Terms and Conditions
                </legend>
                <p class="agreement">
                    <input type="checkbox" value=""/>
                    <label>*  I accept the <a href="#">Terms and Conditions of ALS</a></label>
                </p>
            </fieldset>
            <div><button class="button">Register &raquo;</button></div>
            <input type="hidden" name="MM_insert" value="form" />
        </form>
    </body>
</html>