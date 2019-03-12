# -*- coding: utf-8 -*-
import os, subprocess, sys, smtplib, bottle, sqlite3, logging  # , serial
from bottle import route, run, template, static_file, redirect, request, response, put, post, get, error, hook, Bottle
from datetime import datetime

try:
  import git
except Exception as e:
  print(e)

try:
  dev = True if sys.argv[1] == '-dev' else False
except:
  dev = False

try:
  file = open('info.txt', 'r')
  key, info = file.read().split('-')
  file.close()
except:
  key = 'blah'
  info = 'test'


if not dev:
  pass

@error(404)
def error404(error):
  return template('error404')

@route('/static/<filepath:path>') 
@route('/staticIco/<filepath:path>') 
def server_static(filepath):
  return static_file(filepath, root='./templates')


@route('/')
def listRecipes():
  conn = sqlite3.connect('recipes.db')
  c = conn.cursor()
  c.execute("SELECT name, date, imgLocation, extension FROM recipe_tbl ORDER BY date DESC;")
  result = c.fetchall()
  c.close()
  return template('recipe-list', rows=result)


@route('/recipe-maker', method=["POST","GET"])
@route('/recipe-maker/', method=["POST","GET"])
def recipeMaker():
  global key
  pswd = request.forms.get('password')
  if pswd == info:
    response.set_cookie("userR", 'yes', secret=key)  # , username
    return template('recipe-maker')
  elif pswd != None:
    return template('login', error='Incorrect password')
  return template('login', error=None)


@route('/recipe-done')
def done():
  return template('recipe-done')


@route('/recipe-submit/', method=['POST', 'GET'])
def recipeSubmit():
  try:
    conn = sqlite3.connect('recipes.db')
    c = conn.cursor()
    upload = request.files.get('pic')
    name, ext = os.path.splitext(upload.filename)
    title = request.forms.get('title') or 'empty'
    ingredients = request.forms.get('ingredients') or 'empty'
    method = request.forms.get('method') or 'empty'
    if title != 'empty':
      location = title.replace(' ', '-')
      file_name = location + ext
    else:
      location = upload.filename
      file_name = location
    date = datetime.now().strftime("%d-%m-%Y")
    conn.execute('INSERT INTO recipe_tbl(name, imgLocation, date, method, ingredients, extension) VALUES (?,?,?,?,?,?)', [title, location, date, method, ingredients, ext[1:]])
    conn.commit()

    file_path = "templates/img/{file}".format(file=file_name)
    upload.save(file_path)
    print("File successfully saved to '{0}'.".format(file_name))
    print('-------------- committed a recipe --------------')
  except Exception as e:
    print(e)
  return template('recipe-done')


@route('/h162bs5dkjwels9f74nc7r64', method='POST')
def gitPull():
  git.cmd.Git('/var/www/rsedlrSite').pull()
  print('\n************ Git pull done ************\n')


if __name__ == '__main__':
  # port = int(os.environ.get('PORT', 4000))
  port = 2000  # 80
  host = '127.0.0.1'  # '0.0.0.0'
  if dev:
    run(host='127.0.0.1', port=8080, reloader=True, threaded=True, debug=True)  # 127.0.0.1
  else:
    run(host=host, port=port, reloader=True, threaded=True, debug=False)  # 127.0.0.1


# wordsssssssssssssssssssss

'''
user: request.environ.get('REMOTE_USER', '')
url: request.url
acc id: account_id

@route('/upload', method='POST')
def do_upload():
    category = request.forms.get('category')
    upload = request.files.get('upload')
    name, ext = os.path.splitext(upload.filename)
    if ext not in ('.png', '.jpg', '.jpeg'):
        return "File extension not allowed."

    save_path = "/tmp/{category}".format(category=category)
    if not os.path.exists(save_path):
        os.makedirs(save_path)

    file_path = "{path}/{file}".format(path=save_path, file=upload.filename)
    upload.save(file_path)
    return "File successfully saved to '{0}'.".format(save_path)


# def run_decoupled(app, host='0.0.0.0', port=8080, **config):
#   server = CherryPyWSGIServer((host, port), app, **config)
#   try:
#     server.start()
#   except KeyboardInterrupt:
#     server.stop()
'''