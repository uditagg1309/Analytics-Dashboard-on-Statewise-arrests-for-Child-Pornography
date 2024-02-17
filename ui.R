# Dashboard UI
ui <- dashboardPage(
  
  dashboardHeader(
    title = "Statewise Cases registered for Child Pornography",
    titleWidth = 650, 
    tags$li(class = "dropdown", tags$a(href = "https://www.linkedin.com/in/udit-aggarwal-02178911b/", icon("linkedin"), "My Profile", target = "_blank")),
    tags$li(class = "dropdown", tags$a(href = "https://github.com/uditagg1309/Analytics-Dashboard-on-Statewise-arrests-for-Child-Pornography", icon("github"), "Source code and Report", target = "_blank"))
  ),
  dashboardSidebar(
    sidebarMenu(
      id = "sidebar",
      menuItem("Dataset", tabName = "data", icon = icon("database")),
      menuItem(text = "Visualization", tabName = "viz", icon = icon("chart-line")),
      menuItem(text = "Analysis", tabName = "anova", icon = icon("chart-line")),
      selectInput(inputId = "var1", label = "Select the Crime", choices = choices1, selected = "2019 - CR")
    )
  ),
  
  dashboardBody(
    tabItems(
      #First tab item
      tabItem(tabName = "data",
              #tab box
              tabBox(id = "t1", width = 12,
                     tabPanel("About",
                              fluidRow(
                                column(width = 8,
                                       tags$br() , 
                                       tags$a("This comprehensive dashboard provides a detailed overview of the State/UT-wise occurrences of Cyber Crimes Against Children from 2019 to 2021, specifically focusing on the distribution of cases related to Cyber Pornography, Hosting or Publishing Obscene Sexual Materials Depicting Children. The dashboard offers a nuanced perspective on the prevalence of various criminal activities, categorized into (CR) Child Rape, (CCS) Child Sexual Assault, (CON) Child Online Grooming, (PAR) Possession and Distribution of Child Abuse Material, (PCS) Child Sexual Exploitation, and (PCV) Child Victimization.")),
                                column(width = 4, tags$br() ,
                                       tags$p("Abbrevations used are (CR) Child Rape, (CCS) Child Sexual Assault, (CON) Child Online Grooming, (PAR) Possession and Distribution of Child Abuse Material, (PCS) Child Sexual Exploitation, and (PCV) Child Victimization")
                                )
                              )  
                              
                     ),
                     tabPanel("Data",dataTableOutput("dataT")),
                     tabPanel("Structure",verbatimTextOutput("structure")),
                     tabPanel("Summary",verbatimTextOutput("summary")))),
      tabItem(tabName = "viz",
              #tab box
              tabBox(id = "t1", width = 12,
                     tabPanel("Crime Trends by States",value = "trends", plotlyOutput("bar")),
                     tabPanel("Distribution", value = "distro",plotlyOutput("histplot")))),
      tabItem(tabName = "anova",
              tabBox(id = "t1", width = 12,
                     tabPanel("About",
                              fluidRow(
                                column(width = 8,
                                       tags$br() , 
                                       tags$a("This part of Dashboard compares different crimes per state over years using test of Anova")),
                                column(width = 4, tags$br())
                     
                     )),
                     tabPanel("CR", verbatimTextOutput("CR")),
                     tabPanel("CCS", verbatimTextOutput("CCS")),
                     tabPanel("CON", verbatimTextOutput("CON")),
                     tabPanel("PAR", verbatimTextOutput("PAR")),
                     tabPanel("PCS", verbatimTextOutput("PCS")),
                     tabPanel("PCV", verbatimTextOutput("PCV"))
    )
    
  )
)))
