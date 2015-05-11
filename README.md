# Stocksplosion
Work Sample Test

This project is divided into two parts; a backend running on framework called 
Sinatra, and a frontend interface that runs in a browser. To get the project, 
you can download it as a zip file, unzip it and place it in the location of your
choice, or if you know how to use Git, you can clone the Git repository from 
Github.

#Step 1.

To run the backend, first you'll have to install an interpreter for the Ruby
programming language (version 2.2.2). How you do this depends
on what operating system you're using. If you already have Ruby v2.2.2 installed,
you can skip ahead to step 2.

Windows: 
The easiest way to set up Ruby on Windows is by using the RubyInstaller
for Windows located here: http://rubyinstaller.org/

OS X: 
All modern version of OS X ship with a Ruby interpreter, but it's not
version 2.2.2, so you'll need to install that version. The easiest way to 
install Ruby on OS X is to use a package manager called Homebrew.

Installation instructions for Homebrew and Ruby v2.2.2 can be found here (just
install ruby and ignore the section about installing Rails--you won't need it for
this project):
https://gorails.com/setup/osx/10.10-yosemite

Linux:
If you're running Linux, you have the option of using a built in package manager
to install ruby, but most people recommend you use a tool called rbenv.

Installation instructions for Ubuntu 15.04 can be found here (just install ruby
and ignore the section about installing Rails--you won't need it for this
project):
https://gorails.com/setup/ubuntu/15.04

#Step 2.

OK, now that you've got Ruby installed you need to use Ruby's built in package
manager called RubyGems. 

Open a command prompt and type 'gem install bundler', then press enter. After
that's done, navigate to the directory where you placed the Stocksplosion project.

Once you're in the project directory type 'bundle install', then press enter.
Bundler will download all the gems needed to run the project.

#Step 3.
The project is now all setup and ready to go. From the project directory
type 'ruby app.rb', press enter, and the server will launch.

Open a browser, navigate to "http://localhost:4567", and the frontend interface
will be displayed. 

Now all you have to do is enter in a ticker symbol, and an automcomplete widget
will pop up. You can press tab to fill in the input box with the first hint
in the widget, or use the up and down arrows to navigate. Once you select a hint
you can press enter or tab to fill in the input box.

After the input box is filled in, press enter to display recent performance, and
an automated buy, sell, or wait decision.

The automated buy sell decision uses a simple moving average crossover strategy.
You can read more about that here: http://www.investopedia.com/articles/active-trading/052014/how-use-moving-average-buy-stocks.asp
