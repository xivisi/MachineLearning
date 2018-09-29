#include <lib/list.hpp>


void list_stack_t::insert(link_single_t* link)
{
	assert(link != NULL);
	link->next = this->link;
	this->link = link;
	cnt++;
}

link_single_t* list_stack_t::remove()
{
	assert(stack != NULL);

	link_single_t*	result;

	result = link;
	if(result)
	{
		cnt --;
		link = result->next;
	}

	return result;
}


void list_fifo_t::insert(link_single_t* link)
{
	assert(fifo != NULL);
	assert(link != NULL);

	link->next = NULL;

	if(first)	last->next = link;
	else		first = link;

	last = link;
	cnt++;
}

link_single_t* list_fifo_t::remove()
{
	link_single_t*	result;

	result = first;
	if(result)
	{
		cnt--;
		first = result->next;
		if(first == NULL)
		{
			assert(fifo->cnt == 0);
			last = NULL;
		}
	}
	return result;
}



void list_double_t::insert_first(link_double_t* link)
{
	link_double_t *prev, *next;

	assert(link != NULL);

	cnt ++;

	if(this->link == NULL)
	{
		assert(list->cnt == 1);
		link->next = link;
		link->prev = link;
	}
	else
	{
		next = this->link;
		link->next = next;
		next->prev = link;

		prev = this->link->prev;
		link->prev = prev;
		prev->next = link;
	}
	this->link = link;
}

void list_double_t::insert_last(link_double_t* link)
{
	link_double_t *prev, *next;

	assert(link != NULL);

	this->cnt ++;

	if(this->link == NULL)
	{
		assert(list->cnt == 1);
		link->next = link;
		link->prev = link;
		this->link = link;
	}
	else
	{
		next = this->link;
		link->next = next;
		next->prev = link;

		prev = this->link->prev;
		link->prev = prev;
		prev->next = link;
	}
}

void list_double_t::insert(link_double_t* link, INT offset)
{
	link_double_t *prev, *next;

	assert(link != NULL);

	this->cnt ++;

	if(this->link == NULL)
	{
		assert(list->cnt == 1);
		link->next = link;
		link->prev = link;
		this->link = link;
	}
	else
	{
		next = this->link;
		while(offset == 0)
		{
			if(offset > 0)
			{
				next = next->next;
				offset--;
			}
			else
			{
				next = next->prev;
				offset++;
			}
		}

		link->next = next;
		next->prev = link;

		prev = next->prev;
		link->prev = prev;
		prev->next = link;

		if(next == this->link) this->link = link;
	}
}

link_double_t* list_double_t::remove_first()
{
	link_double_t *result, *next, *prev;


	result =this->link;
	if(result)
	{
		this->cnt--;

		if(result->next == result)
		{
				this->link = NULL;
		}
		else
		{
			next = this->link->next;
			prev = this->link->prev;

			next->prev = prev;
			prev->next = next;
			this->link = next;
		}
	}

	return result;
}

link_double_t* list_double_t::remove_last()
{

	link_double_t *result, *next, *prev;

	result = this->link;
	if(result)
	{
		this->cnt--;

		next = result;
		result = next->prev;

		if(next == result)
		{
			this->link = NULL;
		}
		else
		{
			prev = result->prev;
			next->prev = prev;
			prev->next = next;
		}
	}
	return result;
}

link_double_t* list_double_t::remove(INT offset)
{
	link_double_t *result, *next, *prev;

	assert(list != NULL);

	result = this->link;
	if(result)
	{
		this->cnt--;
		while(offset)
		{
			if(offset > 0)
			{
				result = result->next;
				offset --;
			}
			else
			{
				result = result->prev;
				offset ++;
			}
		}

		prev = result->prev;
		next = result->next;

		if(result == next)
		{
				this->link = NULL;
		}
		else
		{
			prev->next = next;
			next->prev = prev;
			if(this->link == result) this->link = next;
		}
	}
	return result;
}

error_t list_double_t::remove(link_double_t* link)
{
	link_double_t	*next, *prev;
	assert(list != NULL);
	assert(link != NULL);

	#ifdef DEBUG
	next = list->link;
	prev = next->prev;
	while(1)
	{
		if(link == next) break;
		if(next == prev) return ERR_NONE;
		if(link == prev) break;

		next = next->next;
		prev = prev->prev;
	}
	#endif
	this->cnt--;
	assert(link->next != NULL);
	next = link->next;
	if(next == link)
	{
		assert(list->link == link);
		this->link = NULL;
	}
	else
	{
		prev = link->prev;
		prev->next = next;
		next->prev = prev;
		if(this->link == link) this->link = next;
	}

	return ERR_NORMAL;
}

void list_priority_create(list_priority_t* list, list_priority_size_t size)
{

}

UINT list_priority_reset(list_priority_t* list)
{

}

UINT list_priority_count(list_priority_t* list)
{

}

UINT list_priority_insert(list_priority_t* list, link_priority_t* link)
{

}

link_priority_t* 	list_priority_remove(list_priority_t* list, link_priority_t* link)
{

}

error_t 			list_priority_change(list_priority_t* list, link_priority_t* link, UINT priority)
{

}

link_priority_t* 	list_priority_resume(list_priority_t* list, link_priority_t* link)
{

}
