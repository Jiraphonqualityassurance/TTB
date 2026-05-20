*** Settings ***
Library               RequestsLibrary
Library               Collections




# Api
# - Keywords
#Resource          ../Resource/Keywords/Website_Keywords.robot

# - Repositories
#Resource          ../Resource/Repositories/Website_Repositories.robot

# - Variables
Resource          ../Resource/Variables/Api_Variables.robot

# - DataTest
Resource          ../TestData/Data_api.robot
