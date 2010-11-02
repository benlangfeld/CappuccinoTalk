/*
 * Jakefile
 * CappuccinoTalk
 *
 * Copyright (C) 2010 Ben Langfeld <ben@langfeld.me>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

var ENV = require("system").env,
    FILE = require("file"),
    JAKE = require("jake"),
    task = JAKE.task,
    FileList = JAKE.FileList,
    app = require("cappuccino/jake").app,
    configuration = ENV["CONFIG"] || ENV["CONFIGURATION"] || ENV["c"] || "Debug",
    OS = require("os");

app ("CappuccinoTalk", function(task)
{
    task.setBuildIntermediatesPath(FILE.join("Build", "CappuccinoTalk.build", configuration));
    task.setBuildPath(FILE.join("Build", configuration));

    task.setProductName("CappuccinoTalk");
    task.setIdentifier("com.mystudiotools.cappuccinotalk");
    task.setVersion("1.0");
    task.setAuthor("MyStudioTools");
    task.setEmail("info @nospam@ mystudiotools.com");
    task.setSummary("CappuccinoTalk");
    task.setSources((new FileList("**/*.j")).exclude(FILE.join("Build", "**")).exclude(FILE.join("Libraries", "**")));
    task.setResources(new FileList("Resources/**"));
    task.setIndexFilePath("index.html");
    task.setInfoPlistPath("Info.plist");

    if (configuration === "Debug")
        task.setCompilerFlags("-DDEBUG -g");
    else
        task.setCompilerFlags("-O");
});

task ("default", ["CappuccinoTalk"], function()
{
    printResults(configuration);
});

task ("build", ["default"]);

task ("debug", function()
{
    ENV["CONFIGURATION"] = "Debug";

    // Build Libraries
    JAKE.subjake(["Libraries/StropheCappuccino"], "build", ENV);
    JAKE.subjake(["Libraries/GrowlCappuccino"], "build", ENV);
    JAKE.subjake(["Libraries/MessageBoard"], "build", ENV);

    JAKE.subjake(["."], "build", ENV);
});

task ("release", function()
{
    ENV["CONFIGURATION"] = "Release";

    // Build Libraries
    JAKE.subjake(["Libraries/StropheCappuccino"], "build", ENV);
    JAKE.subjake(["Libraries/GrowlCappuccino"], "build", ENV);
    JAKE.subjake(["Libraries/MessageBoard"], "build", ENV);

    JAKE.subjake(["."], "build", ENV);
});

task ("run", ["debug"], function()
{
    OS.system(["open", FILE.join("Build", "Debug", "CappuccinoTalk", "index.html")]);
});

task ("run-release", ["release"], function()
{
    OS.system(["open", FILE.join("Build", "Release", "CappuccinoTalk", "index.html")]);
});

task ("deploy", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Deployment", "CappuccinoTalk"));
    OS.system(["press", "-f", FILE.join("Build", "Release", "CappuccinoTalk"), FILE.join("Build", "Deployment", "CappuccinoTalk")]);
    printResults("Deployment")
});

task ("desktop", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Desktop", "CappuccinoTalk"));
    require("cappuccino/nativehost").buildNativeHost(FILE.join("Build", "Release", "CappuccinoTalk"), FILE.join("Build", "Desktop", "CappuccinoTalk", "CappuccinoTalk.app"));
    printResults("Desktop")
});

task ("run-desktop", ["desktop"], function()
{
    OS.system([FILE.join("Build", "Desktop", "CappuccinoTalk", "CappuccinoTalk.app", "Contents", "MacOS", "NativeHost"), "-i"]);
});

function printResults(configuration)
{
    print("----------------------------");
    print(configuration+" app built at path: "+FILE.join("Build", configuration, "CappuccinoTalk"));
    print("----------------------------");
}