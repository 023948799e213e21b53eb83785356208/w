import discord
import os
import requests
import time
from discord import Intents
from discord.ext import commands
from discord.ext.commands import CommandNotFound
bot = commands.Bot(command_prefix='+')
bot.remove_command("help")


@bot.event
async def on_ready():
    global user
    user = await bot.fetch_user("607319890784944148")
    # await user.send("Hello there!")

@bot.command()
async def call(ctx):
        await ctx.message.attachments[0].save("input.lua")
        os.system("debug.bat")
        time.sleep(0.5)
        await ctx.send(file=discord.File("output.lua"))

        
bot.run('token')
