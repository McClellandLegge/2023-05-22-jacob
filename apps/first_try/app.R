
library("shiny")
library("DBI")
library("RPostgres")

ui <- fluidPage(
  "Hello, world!",
  verbatimTextOutput("foo")
)

server <- function(input, output, session) {

  output$foo <- renderPrint({
    # This will connect IN the docker container

    # con <- dbConnect(
    #   drv = Postgres(), 
    #   user = "postgres", 
    #   password = Sys.getenv("POSTGRES_PASSWORD"), 
    #   host = "db",
    #   port = 5432
    # )

    # development version
    con <- dbConnect(
      drv = Postgres(), 
      user = "postgres", 
      password = "Welcome1",
      host = "192.168.0.50", # or localhost
      port = 6717
    )

    print(con)
  
  })
}
shinyApp(ui, server)

# one user, one app instance = file system \ SQLite
# 2+ users, one app instance = DB
# 2+ users, 2+ app instances = DB