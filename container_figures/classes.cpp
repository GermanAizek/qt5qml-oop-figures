#include "classes.h"
#include <QPainter>
#include "QTime"

int rndColor()
{
	return (qrand() % (255 + 1));
}

Figure::Figure(QQuickPaintedItem *parent)
	: QQuickPaintedItem(parent)
{
	QTime midnight(0,0,0);
	qsrand(midnight.secsTo(QTime::currentTime()));
}

Circle::Circle(QQuickPaintedItem *parent)
	//: QQuickPaintedItem(parent)
{}

void Circle::paint(QPainter *painter)
{
	painter->setRenderHint(QPainter::Antialiasing);
	painter->setPen(QPen(QColor(rndColor(), rndColor(), rndColor(), 255), 20));
	painter->drawEllipse(getPos(), getSize(), getSize());
}

void Triangle::paint(QPainter *painter)
{
	painter->setRenderHint(QPainter::Antialiasing);
	painter->setPen(QPen(QColor(rndColor(), rndColor(), rndColor(), 255), 20));
	painter->drawEllipse(getPos(), getSize(), getSize());
}


void Square::paint(QPainter *painter)
{
	painter->setRenderHint(QPainter::Antialiasing);
	painter->setPen(QPen(QColor(rndColor(), rndColor(), rndColor(), 255), 20));
	painter->drawEllipse(getPos(), getSize(), getSize());
}

