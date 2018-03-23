package main

import (
	"github.com/astaxie/beego"
	"github.com/mkhappy/gowebcron/models"
	_ "github.com/mkhappy/gowebcron/routers"
	"github.com/mkhappy/gowebcron/jobs"
)

const (
	VERSION = "1.0.0"
)

func init() {
	//初始化数据模型
	models.Init()
	jobs.InitJobs()
}

func main() {
	beego.BConfig.WebConfig.Session.SessionOn = true
	beego.Run()
}
