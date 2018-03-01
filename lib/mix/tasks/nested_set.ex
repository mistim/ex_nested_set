defmodule Mix.Tasks.NestedSets.Gen.Schema do
	@shortdoc "Nested Sets"

	@moduledoc """
	"""
	
	use Mix.Task

  alias Mix.Tasks.Phx.Gen.Schema, as: GenSchema

  @switches [migration: :boolean, binary_id: :boolean, table: :string, web: :string]

	def run(args) do
		if Mix.Project.umbrella?() do
      Mix.raise "mix phx.gen.schema can only be run inside an application directory"
    end

		{schema_opts, parsed, _} = OptionParser.parse(args, switches: @switches)
		args = schema_opts ++ validate_args!(parsed)

		GenSchema.run(args)

	end

  @doc false
  def validate_args!([schema, table]) do
    [schema, table, "name:string", "level:integer", "left:integer", "right:integer", "parent_id:integer"]
  end
  def validate_args!([_schema]) do
    raise_with_help "Invalid arguments"
  end
  def validate_args!([]) do
    raise_with_help "Invalid arguments"
  end

  @doc false
  @spec raise_with_help(String.t) :: no_return()
  def raise_with_help(msg) do
    Mix.raise """
    #{msg}

    mix nested_set.new expects both a module name and
    the plural of the generated resource followed by
    any number of attributes:

        mix nested_set.new Blog.Category categories
    """
  end
end