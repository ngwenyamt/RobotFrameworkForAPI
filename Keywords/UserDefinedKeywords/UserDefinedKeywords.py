from robot.libraries.BuiltIn import BuiltIn
import time
from SeleniumLibrary.base import keyword
import requests, json
import string
import random

class UserDefinedKeywords(object):
    Base_url = "https://test-api.isometrix.net"

    token = "Bearer  eyJhbGciOiJSUzI1NiIsImtpZCI6IkI2OUM1MjcxNUY1Nzk0NzgwNzQ5QUMyNjNBRDNEMkQyMjBBMDUwODJSUzI1NiIsInR5cCI6ImF0K2p3dCIsIng1dCI6InRweFNjVjlYbEhnSFNhd21PdFBTMGlDZ1VJSSJ9.eyJuYmYiOjE2Mzg1MzM3ODcsImV4cCI6MTYzODU0MDk4NywiaXNzIjoiaHR0cHM6Ly90ZXN0LWF1dGguaXNvbWV0cml4Lm5ldCIsImNsaWVudF9pZCI6ImU4OTFhNTQxLTFhZjktNDg0ZC05MzYzLThhNDgwZDllYmYxOCIsInN1YiI6IjVkNjdiMDc2LWUxOTctNDkwZS1mMDI2LTA4ZDk4Y2NlMTk0MCIsImF1dGhfdGltZSI6MTYzODUzMzc3NSwiaWRwIjoib2lkYy1henVyZSIsImp0aSI6IkU1RDQ5MUIyMkM0RDBBMDNCQURGQ0MwQUUwNzE1MEEzIiwic2lkIjoiQzQwMjA2OEFCRUFBM0JBQjQyOTZCNzEwMEEzMzk5RDkiLCJpYXQiOjE2Mzg1MzM3ODcsInNjb3BlIjpbIm9wZW5pZCIsInByb2ZpbGUiLCJpc29tZXRyaXgiXSwiYW1yIjpbImV4dGVybmFsIl19.N8N7eD2O3Gv_70fEF1Ae-CRhSwnUgfTJTaxzmZDyLkTmloeIrhV36nkVFq0xVFsrtSnaZXULrKTudPq6TEXTfzLe1A6gitOx4_Md9szvalU8lmFQlXnuI89mzwsyxyZuuf4_TVKSf619nF9LMCZ1pziEudUiZVzg0PYPP2rR07nxvJ-v1Nx4Y5xPAi-6i2MLbpVyVd0Miai188lqwaoNCZPIas6Z2aMcKA7ibIGwItmjf4gM8twFjKfLYVItYpPdw22ajNiy87t59z71dd9yv5tbsp1uIhI6y_F4ZGNCBtkLxZVyycPg6fv-7vu6G61ZlHS0flLFOBG-u0TawQIQsA"
    headers = {"Authorization": token, "Content-Type": "application/json"}



    ############################################### Generic function to create a new record ##############################################################
    @keyword
    def post_requests(self, relative_path, pload):   #pload = body
        response = requests.post(self.Base_url+relative_path, headers=self.headers, data=json.dumps(pload))

        return response

    ############################################### Generic function to Get All the records ##############################################################
    @keyword
    def get_requests_all(self, relative_path):

        response = requests.get(self.Base_url + relative_path, headers=self.headers)
        return response

    ############################################### Generic function to get the record by id #############################################################
    @keyword
    def get_requests_by_id(self, relative_path, _id):
        response = requests.get(self.Base_url + relative_path+'/'+_id, headers=self.headers)
        return response

    ############################################### Generic function to Delete a record by id and the resource version ###################################
    @keyword
    def delete_requests_by_id(self, relative_path, pload):
        response = requests.delete(self.Base_url + relative_path, headers=self.headers, data=json.dumps(pload))
        return response

    ############################################### Generic function to update the record ################################################################
    @keyword
    def put_requests(self, relative_path, pload):
        response = requests.put(self.Base_url + relative_path, headers=self.headers, data=json.dumps(pload))
        return response

    ############################################### Generates unique email address #################################################################
    @keyword
    def generate_email(self):
        all_chars = list(string.digits + string.ascii_letters)
        random.shuffle(all_chars)
        join_string = ''.join(all_chars[:200])
        return join_string+'automationtest01jdfgdhds'+'@isometrix.com'

    @keyword
    def remove_quotes_from_string(self, string_val):
        replaced_string = string_val.replace('"', "")
        return replaced_string
