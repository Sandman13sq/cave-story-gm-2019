/// @desc Deactivate Entities

with ENTITY
{
	if !getBit(flag, Entity_Flag.noDeactivate)
	{
		ds_list_add(other.deactivatedList, id);
		if object_index == PLAYER {msg(getBit(flag, Entity_Flag.noDeactivate))}
		instance_deactivate_object(id);
	}
}