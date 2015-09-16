# SQL::QueryBuilder::OO module for Perl

*Object oriented SQL generator for Perl*

This module provides for an object oriented way to create complex SQL queries
while maintaining code readability. It supports conditions construction and
bound query parameters.

## Synopsis

	use SQL::QueryBuilder::OO;
	
	# Uses an existing DBI database handle
	sqlQuery::setup(-dbh => $dbh);
	
	# Database handle is created when necessary via a sub-routine
	sqlQuery::setup(-connect => sub {
	  DBI->connect(...);
	});
	
	# Full syntax
	$sql = sqlQueryBase::select(qw(id title description), {name => 'author'})
	  ->from('article')
	  ->innerJoin('users', 'userId')
	  ->leftJoin({'comments' => 'c'}, sqlCondition::EQ('userId', 'c.from'))
	  ->where(sqlCondition::AND(
	          sqlCondition::EQ('category')->bind($cat),
	          sqlCondition::NE('hidden')->bind(1)))
	  ->limit(10,20)
	  ->groupBy('title')
	  ->orderBy({'timestamp' => 'DESC'});
	
	$sth = sqlQuery::q($sql)->execute();
	$row = $sth->fetchAssoc();
	$sth->freeResource();
	
	# Overloaded operators
	
	$cond = sqlCondition::EQ('a', 'b') & !sqlCondition::IN('c')->bind([1,2,3]);
	print "$cond";
	# -> (`a` = `b` AND NOT(`c` IN(1,2,3)))
