      <div id="searchbar">
        <table width=100%>
          <tr>
            <td>
              <strong>1.</strong>
              <select OnChange="gotosite(this.options[this.selectedIndex].value)">
                <option value="">Select an Item</option>
<?php foreach ($items as $item): ?>
                <option value="index.php?editor=<?=$curreditor?>&itemid=<?=$item['id']?>"<?php if ($curritem == $item['id']): ?> selected<?php endif;?>><?=$item['Name']?></option>
<?php endforeach;?>
              </select>
            </td>
            <td align="right"> or <strong>&nbsp;2.</strong>
              <form action="index.php" method="GET">
                <input type="hidden" name="editor" value="items">
                <input type="hidden" name="action" value="6"> 
                <input type="text" name="itemid" size="7" value="Item ID" onFocus="clearField(document.forms[0].itemid);"> or <input type="text" name="search" size="20" value="Search by Item Name" onFocus="clearField(document.forms[0].search);">
                <input type="submit" value=" GO ">
              </form>
            </td>
          </tr>
        </table>
      </div>
