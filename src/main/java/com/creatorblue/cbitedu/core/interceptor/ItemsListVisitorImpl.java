package com.creatorblue.cbitedu.core.interceptor;

import net.sf.jsqlparser.expression.operators.relational.ExpressionList;
import net.sf.jsqlparser.expression.operators.relational.ItemsListVisitor;
import net.sf.jsqlparser.expression.operators.relational.MultiExpressionList;
import net.sf.jsqlparser.expression.operators.relational.NamedExpressionList;
import net.sf.jsqlparser.statement.select.SubSelect;

public class ItemsListVisitorImpl implements ItemsListVisitor {


    public void visit(SubSelect ss) {
        //ss.getSelectBody().accept(new SelectVisitorImpl());
    }

    @SuppressWarnings("unchecked")
    public void visit(ExpressionList el) {
    }

	public void visit(MultiExpressionList multiexpressionlist) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(NamedExpressionList arg0) {
		// TODO Auto-generated method stub
		
	}

}

