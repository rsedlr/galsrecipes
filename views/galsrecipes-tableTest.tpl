<!DOCTYPE html>
<html>
  <head>
    <style>

    h1{
        font-family: consolas, vedonas, arial;;
        font-size: 100px;
        color: #9EC9CF;
        border: 6px solid #9EC9CF;
        border-radius: 25px;
        padding-left: 15px;
        padding-right:300px;
        padding-top:5px;
        padding-bottom:15px;
        margin-left:30px;
        margin-right:120px;
    }

    img {

        max-height:100px;
        border: 6px solid #9EC9CF;
        border-radius: 25px;
        vertical-align: middle;
        width: auto;
    }

    img:hover {border-color:  #2F3C3E;}

    #menu1 {
        font-family: verdana;
        font-size: 20px;
        color:red
    }

    a.one:link, a.one:visited {
        margin-left:30px;
        border-radius: 25px;
        vertical-align: middle;
        background-color: #9EC9CF;
        color: white;
        height: 100px;
        width: 70%;
        padding-left: 15px;
        padding-top:15px;
        font-family: consolas, vedonas, arial;
        font-size: 39px;
        text-align: left;
        text-decoration: none;
        display: inline-block;
    }

    a.one:hover {background-color: #2F3C3E;}

    a.two:link, a.two:visited{}

    </style>
  </head>
  <body>
    <h1>Gals Recipes</h1>

    %for row in rows:
      <a class="one" href="Recipes/Spinach-Chickpeas-Mushrooms.html" target="_blank">{{row}}</a>
      <a class="two" href="Recipes/img/spinach-mushroom-chickpea.jpg">
      <!-- <img src="Recipes/img/spinach-mushroom-chickpea.jpg" alt="slurp" onerror="if (this.src != 'Recipes/img/spinach-mushroom-chickpea.jpg') this.src = 'Recipes/img/backup.png';"> -->
      <p></p>
    %end

  </body>
</html>

<!-- <p>The open items are as follows:</p>
<table border="1">
%for row in rows:
  <tr>
  %for col in row:
    <td>{{col}}</td>
  %end
  </tr>
%end
</table> -->