#ifndef CLASSES_H
#define CLASSES_H

#include <QQuickPaintedItem>

class Figure : public QQuickPaintedItem
{
	Q_OBJECT

public:
	Figure(QQuickPaintedItem *parent = nullptr);

public slots:
	QPointF getPos() { return pos; }
	int getSize() { return size; }
	QPointF setPos(int x, int y) { pos = std::move(QPointF(x, y)); }
	int setSize(int newsize) { size = newsize; }

private:
	QPointF pos = QPointF(100, 100);
	int size = 64;
};

class Circle : public Figure
{
	Q_OBJECT

public:
	Circle(QQuickPaintedItem *parent = nullptr);

protected:
	void paint(QPainter *painter);
};

class Triangle : public Figure
{
	Q_OBJECT

public:
	Triangle(QQuickPaintedItem *parent = nullptr);

protected:
	void paint(QPainter *painter);
};

class Square : public Figure
{
	Q_OBJECT

public:
	Square(QQuickPaintedItem *parent = nullptr);

protected:
	void paint(QPainter *painter);
};

class FigureManager : public QObject
{
	Q_OBJECT
	Q_PROPERTY(QList<QObject*> figures READ getFigureList NOTIFY figuresChanged)

public:
	QList<QObject*> getFigureList() const { return figurelist; }

signals:
	void figuresChanged();

private:
	QList<QObject*> figurelist;
};

#endif // CLASSES_H
