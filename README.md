# Swagger UI Static Engine

I was documenting my API.  I wanted to include [Swagger UI](http://swagger.io/swagger-ui/) as simply as possible.

Swagger UI is schweet, because, as they say:

> [_Swagger UI is a dependency-free collection of HTML, Javascript, and CSS assets ... just clone this repo and use the
pre-built files in the dist folder_](https://github.com/swagger-api/swagger-ui#download)

At first, I just copied the `dist` folder into my `/public` directory.  Awesome!  It's self-contained and just works.

But then, I had 25k lines of code in my git repo that, didn't belong there.  So, I looked for more elegant ways
to include it in my project ...

I found some nice projects like:

* https://github.com/batdevis/swagger_engine
* https://github.com/d4be4st/swagger-ui_rails

The problem is, these projects had fallen out of date.  I cloned them and tried to update them, but it was
complicated to just, copy the new swagger-ui/dist folder over, because these folks had really wired them up in the asset
pipeline and, in order to update them I had to mangle / merge / adapt the Swagger UI quite a bit.  I thought, what I
really wanted was just, the static files, in a separate git repo, in an engine, that I could keep up to date, edit simply
(if later I want to tweak the look of things, etc).

So, that's what I have done here.  It's mostly just the [Swagger UI
dist](https://github.com/swagger-api/swagger-ui/tree/master/dist) folder, in the public directory of the engine.


## Swagger UI Version

**Contains Swagger UI version: 2.1.4**

The version number of this RubyGem will mirror Swagger UI's ...


## Philosophy

This isn't really a gem that you configure, it's a gem that you fork and modify.  I'm purposefully trying to alter the
static Swagger UI files, as little as possible.  The more mods I make, the harder this will be to keep up with the
Swagger UI project.  Additionally, there's no way for me to anticipate exactly how I will want to modify the Swagger UI
files to customize them for my project.  I plan to make any customizations that I want, by editing the files directly in
this repo.


## Install

_config/initializers/swagger_ui_static_engine.rb_

    SwaggerUiStaticEngine::Engine.swagger_url = "/api/swagger.json" # the path to your swagger.json file

_config/routes.rb_

    Rails.application.routes.draw do
      mount SwaggerUiStaticEngine::Engine, at: '/docs'
    end


If you are including this inside another engine (as I am, my 'Api' engine), you will need these extra files:

_lib/yourengine.rb_

    require 'swagger_ui_static_engine'

_lib/yourengine/yourengine.rb_

    module YourEngine
      class Engine < ::Rails::Engine
        # combine this engine's static assets with the static assets of the hosting site
        initializer "static assets" do |app|
          app.middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public")
        end
      end
    end


## Updating with new Swagger UI version

    ./update_swagger_ui_source.sh
    git diff
    <edit index.html.erb to view & merge anything that was overwritten>

