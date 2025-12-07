SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT DISTINCT Vehicle_ID FROM vehicle_driver)
