#include "classes.h"
#include <QPainter>
#include <QQmlProperty>

static int rndColor()
{
	return (qrand() % (255 + 1));
}

Circle::Circle(QQuickPaintedItem *parent)
	//: QQuickPaintedItem(QPixmap())
{}

void Circle::paint(QPainter *painter)
{
	//painter->save();
	//painter->setRenderHint(QPainter::Antialiasing);
	painter->setPen(QPen(QColor(rndColor(), rndColor(), rndColor(), 255), 20));
	painter->drawEllipse(getPos(), getSize(), getSize());
	//painter->restore();
}

Triangle::Triangle(QQuickPaintedItem *parent)
	//: QQuickPaintedItem(parent)
{}

void Triangle::paint(QPainter *painter)
{
	//painter->save();
	//painter->setRenderHint(QPainter::Antialiasing);
	painter->setPen(QPen(QColor(rndColor(), rndColor(), rndColor(), 255), 20));
	QPolygonF Rectangle;
	int x1 = getPos().x();
	int y1 = getPos().y() + getSize()*2;
	int x2 = getPos().x() + getSize()*2;
	int y2 = getPos().y() + getSize()*2;
	int x3 = getPos().x() + getSize();
	int y3 = getPos().y();

	Rectangle.append(QPointF(x1,y1));
	Rectangle.append(QPointF(x2,y2));
	Rectangle.append(QPointF(x3,y3));
	painter->drawPolygon(Rectangle);
	//painter->restore();
}

Square::Square(QQuickPaintedItem *parent)
	//: QQuickPaintedItem(parent)
{}

void Square::paint(QPainter *painter)
{
	//painter->save();
	//painter->setRenderHint(QPainter::Antialiasing);
	painter->setPen(QPen(QColor(rndColor(), rndColor(), rndColor(), 255), 20));
	int x1 = getPos().x();
	int y1 = getPos().y();
	int x2 = getPos().x() + getSize()*0.8f;
	int y2 = getPos().y() + getSize()*0.8f;

	painter->drawRect(QRect(x1,y1,x2,y2));
	//painter->restore();
}

