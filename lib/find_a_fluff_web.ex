defmodule FindAFluffWeb do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use FindAFluff.Web, :controller
      use FindAFluff.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def model do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
    end
  end

  def controller do
    quote do
      use Phoenix.Controller, namespace: FindAFluffWeb

      alias FindAFluff.Repo
      import Ecto
      import Ecto.Query

      import FindAFluffWeb.Router.Helpers
      import FindAFluffWeb.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/find_a_fluff_web/templates",
                        namespace: FindAFluffWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import FindAFluffWeb.Router.Helpers
      import FindAFluffWeb.ErrorHelpers
      import FindAFluffWeb.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel

      alias FindAFluff.Repo
      import Ecto
      import Ecto.Query
      import FindAFluffWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
