library(taskscheduleR)

taskscheduler_create(
  taskname = "scrape_runescape",
  rscript = "C:\\Users\\Braden\\Documents\\RuneScape-Data-Scraping-and-Cleaning\\webscrapescript.R",
  schedule = "MINUTE",
  starttime= format(Sys.time() + 60, "%H:%M"),
  startdate = format(Sys.Date(), "%m/%d/%Y")
)


#taskscheduler_delete('scrape_runescape')
