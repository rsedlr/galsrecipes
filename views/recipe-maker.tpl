<!doctype html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Recipe Maker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="//code.jquery.com/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <style>
      img {
        margin: 15px auto;
        width: 60%;
        max-height: 300px;
        min-width: 100px;
      }

      input {
        margin: 15px auto;
      }

      #drop-zone {
          /*Sort of important*/
          width: 300px;
          /*Sort of important*/
          height: 200px;
          position:absolute;
          left:50%;
          top:100px;
          margin-left:-150px;
          border: 2px dashed rgba(0,0,0,.3);
          border-radius: 20px;
          font-family: Arial;
          text-align: center;
          position: relative;
          line-height: 180px;
          font-size: 20px;
          color: rgba(0,0,0,.3);
      }

      #drop-zone input {
          position: absolute;
          cursor: pointer;
          left: 0px;
          top: 0px;
          /*Important This is only comment out for demonstration purposes.
          opacity:0; */
      }

      #drop-zone.mouse-over {
          border: 2px dashed rgba(0,0,0,.5);
          color: rgba(0,0,0,.5);
      }

      #clickHere {
          position: absolute;
          cursor: pointer;
          left: 50%;
          top: 50%;
          margin-left: -50px;
          margin-top: 20px;
          line-height: 26px;
          color: white;
          font-size: 12px;
          width: 100px;
          height: 26px;
          border-radius: 4px;
          background-color: #3b85c3;
      }

      #clickHere:hover {
          background-color: #4499DD;
      }

      input#file {
        display: inline-block;
        width: 100%;
        padding: 120px 0 0 0;
        height: 26px;
        overflow: hidden;
        outline: none;
      }
    </style>
  </head>
  <body>
    <div id="main" class="boxCol" style="padding: 50px 80px;">
      <!-- <form role="form" id="recipeForm"> -->
      <form action="/recipe-submit/" method="post" enctype="multipart/form-data">
        <div class="container" style="padding: 0">
          <div class="row">
            <div class="col-md-6 col-sm-12">
              <h1 style="font-weight: bolder; font-size: 50px; margin-bottom: 20px">Recipe Maker</h1>
              <div class="row">
                <div class="form-group col-sm-12">
                  <label for="title" class="h2 white bold">Title</label>
                  <input type="text" class="form-control" name="title" placeholder="Enter Title" required>
                </div>
              </div>
              <div class="row">
                <div class="form-group col-sm-6">
                  <label for="time" class="h2 white bold">Time To Make</label>
                  <input type="text" class="form-control" name="time" placeholder="Enter cooking Duration" required>
                </div>
                <div class="form-group col-sm-6">
                  <label for="serving" class="h2 white bold">Serving</label>
                  <input type="number" class="form-control" name="serving" placeholder=1 required>
                </div>
              </div> 
              <input type="file" name="pic" id="pic" accept="image/*">  
              <img id="imgPreview" src="#" alt="Your Image" style="visibility: hidden;"><br>
            </div>
            <div class="col-md-6 col-sm-12" style="padding-top: 90px">
              <div class="form-group">
                <label for="ingredients" class="h2 white bold">Ingredients</label>
                <textarea name="ingredients" class="form-control" rows="5" placeholder="Each new line will be a new row in the table" required></textarea>
              </div>
              <div class="form-group">
                <label for="method" class="h2 white bold">Method</label>
                <textarea name="method" class="form-control" rows="5" placeholder="Each new line will be a new row in the table" required></textarea>
              </div>

              <div class="col-md-6 col-sm-12" style="padding-left: 15px;">
                <button type="submit" id="form-submit" class="btn proj-btn main-btn btn-primary btn-lg" style="padding-left: 0">Submit</button>
                <div id="msgSubmit" class="h5 text-center boxCol fit-content" style="visibility: hidden;">.</div>
              </div>

              <!-- <div id="drop-zone">
                Drop files here...
                <div id="clickHere">
                  or click here..
                  <input id="file" type="file">
                </div>
              </div> -->
              <!-- <input type="file" name="pic"> -->
            </div>
          </div>
        </div>
      </form>
    </div>
    <script>
      function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
          $("#imgPreview").css('visibility', 'visible');
          $('#imgPreview').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        }
      }

      $("#pic").change(function() {
        readURL(this);
      });
    </script>
  </body>
</html>
