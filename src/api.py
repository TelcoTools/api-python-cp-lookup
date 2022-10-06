#!/usr/bin/env python3

# Import important and system librarires

# Import script-specific libraries
from datetime import datetime
from flask import Flask
from flask_restful import Resource, Api
import phonenumbers
import sqlite3

class NotFoundException (Exception) :
	pass

# First, sanitise the provided number
def sanitiseNumber(phoneNumber, country = "GB") :
	x = phonenumbers.parse(phoneNumber, country)
	return phonenumbers.format_number(x, phonenumbers.PhoneNumberFormat.E164)

# Second, remove the +44 from it
def removePlusFourFour(phoneNumber) :
	return str(phoneNumber)[3:]

# Last, create the SQL IN string that's going to be used to search for the numberrange
def createSQLInString(phoneNumber) :
	return ",".join([phoneNumber [0:i] for i in range(1, len(phoneNumber) + 1)])

# Do the database lookup
def doSQLLookup(number) :
	connection	=	sqlite3.connect("../db/TelcoToolsCPData.db")
	cursor		=	connection.cursor()
	inString	=	createSQLInString(removePlusFourFour(sanitiseNumber(number)))
	response	=	cursor.execute("SELECT `number`, `status`, `cp`, `num_length`, `use`, `last_change`, `timestamp` FROM `numbering_allocation` WHERE `number` IN (" + inString + ") ORDER BY LENGTH(`number`) DESC LIMIT 1").fetchone()
	cursor.close()
	if response is None :
		raise NotFoundException ("No results found")
	else :
		return (response)

app = Flask(__name__)
api = Api(app)
VERSION='3.0a'
class LookupNumber(Resource):
	# GET /v3/:number
	def get(self, number):
		try:
			# Got number from DB
			response = doSQLLookup(number)
			return {'number':number, 'status': response[1], 'cp': response[2], 'timestamp': datetime.now().strftime('%Y-%m-%d %H:%M:%S'), 'last_updated': response[6], 'range': response[0]},200
		except NotFoundException as e:
			# Failed to find number
			return {'number': number, 'status': "Not found", 'timestamp': datetime.now().strftime('%Y-%m-%d %H:%M:%S')},404
		except phonenumbers.phonenumberutil.NumberParseException:
			# libphonenumber didn't like that one
			return {'number': number, 'status': "Invalid Request", 'error_details': "A valid GB phone number was not provided", 'timestamp': datetime.now().strftime('%Y-%m-%d %H:%M:%S')},400
		except Exception as e:
			# Some funky shit going on here
			print(e)
			return {'number': number, 'status': "Internal Server Error", 'error_details': "Please try again, if this persists contact the administrator.", 'timestamp': datetime.now().strftime('%Y-%m-%d %H:%M:%S')},500

api.add_resource(LookupNumber, '/lookup/<string:number>') # Fetch Number Details

if __name__ == '__main__':
	app.run(host='0.0.0.0',port=5000,debug=False)
