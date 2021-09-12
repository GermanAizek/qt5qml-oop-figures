#ifndef CLASSES_H
#define CLASSES_H

#include <QQuickPaintedItem>

class Figure : public QQuickPaintedItem
{
	Q_OBJECT
	//Q_PROPERTY(bool getPos READ getPos CONSTANT)
	//Q_PROPERTY(bool getSize READ getSize CONSTANT)

public:
	Figure(QQuickPaintedItem* parent = nullptr)
		: pos(std::move(QPointF(80, 80)))
		, size(64)
	{}
	QPointF getPos() const { return pos; }
	int getSize() const { return size; }
/*
public slots:

	QPointF setPos(int x, int y) { pos = std::move(QPointF(x, y)); }
	int setSize(int newsize) { size = newsize; }
*/

private:
	QPointF pos;
	int size;
};

class Circle : public Figure
{
	Q_OBJECT

public:
	Circle(QQuickPaintedItem* parent = nullptr);


protected:
	void paint(QPainter* painter);
};

class Triangle : public Figure
{
	Q_OBJECT

public:
	Triangle(QQuickPaintedItem* parent = nullptr);

protected:
	void paint(QPainter* painter);
};

class Square : public Figure
{
	Q_OBJECT

public:
	Square(QQuickPaintedItem* parent = nullptr);

protected:
	void paint(QPainter* painter);
};

#endif // CLASSES_H
