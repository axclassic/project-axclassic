      <center>
        <br><br><br>
        <h1>AX-Classic Database Editing Interface</h1>
        <br><br>

<?if($error == 1):?>
        <font color="red">Invalid username or password</font><br><br><br>
<?endif;?>

        <form method="post" action="index.php?login">
        <table width="250">
          <tr>
            <td align="left">
              <strong>Login:</strong>
            </td>
            <td align="right">
              <input type="text" name="login" value="<?=$login?>">
            </td>
          </tr>
          <tr>
            <td align="left">
              <strong>Password:</strong>
            </td>
            <td align="right">
              <input type="password" name="password" value="<?=$password?>">
            </td>
          </tr>
          <tr>
            <td colspan="2" align="center">
              <br><br><input type="submit" value="Login" style="width:60px;"><br><br><br>
              
              <a><b>THIS IS THE TEST SERVER DATABASE for AX_CLASSIC!</b> <br>
		  Edit on Rathe editor - No guest logins allowed.</a>
            </td>
          </tr>
        </table>
        </form>
      </center>