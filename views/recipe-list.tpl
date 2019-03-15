<!DOCTYPE html>
<html>
  <head>
    <style>

      html {
        font-family: consolas, vedonas, arial;;
      }

      h1{
          font-family: consolas, vedonas, arial;;
          font-size: 100px;
          width: calc(70% - 18px);
          color: #9EC9CF;
          border: 6px solid #9EC9CF;
          border-radius: 25px;
          padding: 5px 5px 15px 15px;
          margin-left: 30px;
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

      .button {
        font-family: consolas, vedonas, arial;;
        text-decoration: none;
        font-weight: bold;
        background-color: #9EC9CF;
        border-radius: 25px;
        font-size: 39px;
        color: #fff;
        margin-left: 30px;
        vertical-align: middle;
        height: 55px;
        width: 70%;
        padding-left: 15px;
        padding-top: 5px;
        text-align: left;
        display: inline-block;
        margin-bottom: 30px;
      }
      .button:hover {
        background-color: #2F3C3E;
      }

    </style>
  </head>
  <body>
    <h1>Gals Recipes</h1>

    % for row in rows:
      <a class="one" href="/recipe/{{row[2]}}">
        <span style="font-weight: bold">{{row[0]}}</span>
        <br>
        <span style="font-size: 25px; padding-left: 3px">{{row[1]}}</span>
      </a>
      % import os ; imgLoc = 'backup2.png' if not os.path.isfile('templates/img/' + row[2] + '.' + row[3]) else row[2] + '.' + row[3]
      <a class="two" href="/static/img/{{row[2]}}.{{row[3]}}">
        <img src="/static/img/{{imgLoc}}" alt="slurp">
      <p></p>
      </a>
    % end

    <a href="/recipe-maker" class="button">Add Recipe</a>
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