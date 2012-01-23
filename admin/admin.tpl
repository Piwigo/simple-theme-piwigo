<div class="titrePage">
  <h2>Simple Theme Configuration</h2>
</div>

<form method="post" class="properties" action="" class="properties">
  <div>
    <fieldset>
      <legend>{'Albums'|@translate}</legend>
        <ul>
          <li><label>
            <span class="property">{'Album title and description'|@translate}</span>&nbsp;
            <select name="albumDisplay" style="min-width:150px;">
              <option value="column" {if ($options.albumDisplay=="column")}selected="selected"{/if}>{'under the album thumbnail'|@translate}</option>
              <option value="line" {if ($options.albumDisplay=="line")}selected="selected"{/if}>{'next to the album thumbnail'|@translate}</option>
            </select>
          </label></li>
        </ul>
      </fieldset>
  </div>
  <p><input class="submit" type="submit" value="{'Save Settings'|@translate}" name="submit" /></p>
</form>