{**
 * Список управляющих блога
 *
 * @styles css/blocks.css
 *}

{extends 'components/block/block.tpl'}

{block 'block_title'}
	{$aLang.blog.administrators}
{/block}

{block 'block_options' append}
	{$mods = "{$mods} blog-admins"}
{/block}

{block 'block_content'}
	{* Создатель *}
	{include 'components/user/user-list-small.tpl' users=[ $oBlog->getOwner() ] title=$aLang.blog.owner}

	{* Администраторы *}
	{if count($aBlogAdministrators)}
		{include 'components/user/user-list-small.tpl' users=$aBlogAdministrators title="{$aLang.blog.administrators} ({count($aBlogAdministrators)})"}
	{/if}

	{* Модераторы *}
	{if count($aBlogModerators)}
		{include 'components/user/user-list-small.tpl' users=$aBlogModerators title="{$aLang.blog.moderators} ({count($aBlogModerators)})"}
	{/if}
{/block}