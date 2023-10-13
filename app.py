# Standard imports
import os
from flask import Flask, render_template, redirect, request



# Begin
app=Flask(__name__)
# app.jinja_options["autoescape"] = lambda _: True


@app.route('/')
def index():
    return render_template('index.html')




if __name__ == '__main__':
    app.run(debug=True, port=int(os.environ.get('PORT', 5001)))