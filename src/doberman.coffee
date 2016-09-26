# Description:
#   Hubot script to return dobermans at your command.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot doberman me - Receive a doberman

dobermansJsonUrl = "https://raw.githubusercontent.com/kwandrews7/hubot-dobermanme/master/src/dobermans.json"

module.exports = (robot) ->

  robot.respond /doberman me/i, (msg) ->
    msg.http(dobermansJsonUrl)
      .get() (err, res, body) ->
        dobs = JSON.parse(body)
        i = Math.floor(Math.random() * dobs.length)
        msg.send dobs[i]

  robot.respond /how many dobermans are there/i, (msg) ->
    msg.http(dobermansJsonUrl)
      .get() (err, res, body) ->
        msg.send "There are #{JSON.parse(body).length} dobermans."

