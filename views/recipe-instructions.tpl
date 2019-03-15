<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="/static/recipe.css">
  </head>
  <body>
    <div style="margin: 3% 7%">
      <h1 style="font-size: 80px; font-weight: 800; font-family: consolas, vedonas, arial">{{title}}</h1>
      <h2 style="font-size: 30px; font-weight: 700; font-family: consolas, vedonas, arial">Serves: {{serving}}</h2>
      <h2 style="font-size: 30px; font-weight: 700; font-family: consolas, vedonas, arial">Time: {{time}}</h2>
      <table class="ingredients">
        <tr>
          <th>Ingredients</th>
        </tr>
        % for ingredient in ingredients:
          <tr>
            <td>{{ingredient}}</td>
          </tr>
        % end
      </table>
      <br>
      <table class="method">
        <tr>
          <th>Method</th>
        </tr>
        % for method in methods:
          <tr>
            <td>{{method}}</td>
          </tr>
        %end
      </table>
    </div>
  </body>
</html>