---
layout: page
title: Discussion 1 - 1/25
description: notes, links, example code and exercises
---

### survey:

* your name
* your program, your year
* your next step? continue research or industry
* what is your view of data science
* what is your favorite programming language?

## expectations

- bring your laptop to class every time
- very active participation. no practice = no learning.
    * ask questions
    * try things out, spend time debugging, again and again
    * help others with their practical roadblocks

## what is data science?

**I don't know...**

But ![from internet](../assets/siteFigure/whatisdatascience.png)

## what you may need to learn

- [Unix shell](http://cecileane.github.io/computingtools/pages/notes0906-intro-shell.html)
- [Github](http://cecileane.github.io/computingtools/pages/git.html)
- [Python](http://cecileane.github.io/computingtools/pages/pythoninstallation.html)
- Database manipulate
  - [SQL](https://www.w3schools.com/sql/)
  - [dplyr](https://dplyr.tidyverse.org/)
  - [Pandas](https://pandas.pydata.org/)
  - ...
- Visualization
  - [ggplot2](https://ggplot2.tidyverse.org/)
  - [plotly](https://plot.ly/)
  - [matplotlib](https://matplotlib.org/)
  - ...

#### I am *not* for:

- google it for you. For example, if you ask my _how to install jupyter notebook_, I will send you this [link](http://lmgtfy.com/?q=how+to+install+jupyter+notebook)
- teach how to use a programming language. **YOU SHOULD PRACTICE**
- tell how past students do the module. You shouldn't ask for any kind of code or material also. We will check them. 


## Question?

- I personally like coding, if you want, we can practice together. For example, [leetcode weekly contest](https://leetcode.com/contest/)


Github 
----------------

Let's first try [Karl Broman](https://kbroman.org)'s [tutorial](https://kbroman.org/github_tutorial/pages/first_time.html), which I used every time.

- Get a [github](https://github.com) account.
- Download and install [git](https://git-scm.com/downloads).
- Set up git with your user name and email.

  - Open a terminal/shell and type:

        $ git config --global user.name "Your name here"
        $ git config --global user.email "your_email@example.com"

    (Don't type the `$`; that just indicates that you're doing this at
    the command line., replace wired "Your name here" and "your_email@example.com" as your own user name and email used to register github)

- Set up ssh on your computer.
  [Roger Peng](http://www.biostat.jhsph.edu/~rpeng)'s
  [guide to setting up password-less logins](http://www.biostat.jhsph.edu/bit/nopassword.html).
  Also, see [github's guide to generating SSH keys](https://help.github.com/articles/generating-ssh-keys).

  - Look to see if you have files `~/.ssh/id_rsa` and
  `~/.ssh/id_rsa.pub`.
  - If not, create such public/private keys: Open a terminal/shell and type:

        $ ssh-keygen -t rsa -C "your_email@example.com"

  - Copy your public key (the contents of the newly-created
    `id_rsa.pub` file) into your clipboard.

  **Further reading**: [SSH login without password](http://www.linuxproblem.org/art_9.html). For example, you may use [Amazon Web Service](https://aws.amazon.com/) or any kind of remote server.

- Paste your ssh public key into your github account settings.

  - Go to your github [Account Settings](https://github.com/settings/profile)
  - Click &ldquo;[SSH Keys](https://github.com/settings/ssh)&rdquo; on the left.
  - Click &ldquo;Add SSH Key&rdquo; on the right.
  - Add a label (like &ldquo;My laptop&rdquo;) and paste the public
    key into the big text box.
  - In a terminal/shell, type the following to test it:

        $ ssh -T git@github.com

  - If it says something like the following, it worked:

        Hi username! You've successfully authenticated, but Github does
        not provide shell access.

**Recommended Practice**: [Github laboratory](https://github.com/kbroman/Tools4RR/edit/master/05_Git_Lab/git_lab.md)

RShiny
----------------

I do not know [JavaScript](https://www.javascript.com/), you may try [this](https://medium.freecodecamp.org/how-to-build-an-html-calculator-app-from-scratch-using-javascript-4454b8714b98) if you want, but I do _not recommend_ 

The following tutorial borrows from [Rstudio shiny tutorial](https://shiny.rstudio.com/tutorial/written-tutorial/lesson1/). 

You can also try this [Advance shiny tips](https://deanattali.com/blog/advanced-shiny-tips/)

Free server [Shinyapps](https://www.shinyapps.io/)

1. Install [R](https://cran.r-project.org/) and [shiny](https://shiny.rstudio.com/) package
2. Run the very first example

    ```R
    install.packages("shiny")
    library(shiny)
    runExample("01_hello")
    ```

    If you notice that it require two parts, `ui` (how it looks like) and `server` (how it work inside)

**Start practice**
3. create an `some_random_name.R` script, copy paste the following code into it. [fluidPage](https://shiny.rstudio.com/reference/shiny/1.0.1/fluidPage.html)
    
    ```R
    library(shiny)
    ui <- fluidPage(
        titlePanel("Discussion 628")
    )
    server <- function(input, output) {}
    shinyApp(ui = ui, server = server)
    ```

4. Classic `Hello World`. How to print a text? Always check [Gallery](https://shiny.rstudio.com/gallery/) and [Reference](https://shiny.rstudio.com/reference/).

    You can use [`h1(...)`](https://shiny.rstudio.com/reference/shiny/1.0.0/builder.html)

    ```R
    library(shiny)
    ui <- fluidPage(
        titlePanel("Discussion 628")
        ## Code you should write. No unique answer
        ## Do remember add , at the end of titlePanel("Discussion 628")
    )
    server <- function(input, output) {}
    shinyApp(ui = ui, server = server)
    ```
5. Add more panels. [UI layout](https://shiny.rstudio.com/reference/shiny/1.2.0/)

   1. `titlePanel`, `sideBarPanel`, `mainPanel` or no panel
   2. add a [`sidebarPanel`](https://shiny.rstudio.com/reference/shiny/1.0.1/sidebarPanel.html)

    ```R
    ...
    ui <- fluidPage(
        titlePanel("Discussion 628"),
        ## Code you should write. No unique answer
    )
    ...
    ```

6. Input data. [Widget Gallery](https://shiny.rstudio.com/gallery/widget-gallery.html)
    
    Based on the input give the result.

    ```R
    ...
    ui <- fluidPage(
        titlePanel("Discussion 628"),
        # For example, `expression` will be hold in input
        textInput("expression", label = h3("Equation input"), value = "1+1")
    )
    ...
    ```

    **Practice**: Based on the [Widget Gallery](https://shiny.rstudio.com/gallery/widget-gallery.html) choose one or two widgets and play with the ui function. 

7. Output result [render](https://shiny.rstudio.com/reference/shiny/1.2.0/) function
    
    ```R
    ...
    ui <- fluidPage(
        titlePanel("Discussion 628"),
        # For example, `expression` will be hold in input
        textInput("expression", label = h3("Equation input"), value = "1+1"),
        verbatimTextOutput("value")
    )
    server <- function(input, output) {
        # `value` will in the output
        output$value = renderPrint({
            input$expression
        })
    }
    ```

**Practice**: Create a Shiny app to calculate [Fibonacci number](https://en.wikipedia.org/wiki/Fibonacci_number)

---
