#ifndef CLASSES_H
#define CLASSES_H

#include <QQuickPaintedItem>

class Figure : public QQuickPaintedItem
{
	Q_OBJECT

public:
	Figure(QQuickPaintedItem* parent = nullptr)
		: pos(std::move(QPointF(80, 80)))
		, size(64)
	{}
	QPointF getPos() const { return pos; }
	int getSize() const { return size; }

private:
	QPointF pos;
	int size;
};

class Circle : public Figure
{
	Q_OBJECT

public:
	Circle(QQuickPaintedItem* parent = nullptr) {};
	Q_INVOKABLE std::string getType() const { return "circle"; }

protected:
	void paint(QPainter* painter);
};

class Triangle : public Figure
{
	Q_OBJECT

public:
	Triangle(QQuickPaintedItem* parent = nullptr) {};
	Q_INVOKABLE std::string getType() const { return "triangle"; }

protected:
	void paint(QPainter* painter);
};

class Square : public Figure
{
	Q_OBJECT

public:
	Square(QQuickPaintedItem* parent = nullptr) {};
	Q_INVOKABLE std::string getType() const { return "square"; }

protected:
	void paint(QPainter* painter);
};

class Cleaner : public Figure
{
	Q_OBJECT

public:
	Cleaner(QQuickPaintedItem* parent = nullptr) {};

protected:
	void paint(QPainter* painter);
};

#endif // CLASSES_H
