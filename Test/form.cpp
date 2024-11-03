#include "form.h"
#include "ui_form.h"

Form::Form(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::Form)
{
    ui->setupUi(this);

    setAutomationId("QtWidgetWindow");
    ui->progressBar->setAccessibleName("ProgressBar");
    ui->pushButton->setAccessibleName("Button");
    ui->progressBar->setAutomationId("ProgressBar");
    ui->pushButton->setAutomationId("Button");
}

Form::~Form()
{
    delete ui;
}

void Form::on_pushButton_clicked()
{
    auto newValue = ui->progressBar->value() + 20;
    if(newValue > 100)
        newValue = 0;
    ui->progressBar->setValue(newValue);

    ui->progressBar->setAutomationId("New ProgressBar");
}
