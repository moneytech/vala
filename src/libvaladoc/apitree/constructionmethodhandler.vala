/*
 * Valadoc - a documentation tool for vala.
 * Copyright (C) 2008 Florian Brosch
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */


using Vala;
using GLib;
using Gee;


public interface Valadoc.ConstructionMethodHandler : Basic, MethodHandler {
	public Gee.Collection<Method> get_construction_method_list () {
		return get_children_by_type (Api.NodeType.CREATION_METHOD);
	}

	public void visit_construction_methods ( Doclet doclet ) {
		accept_children_by_type (Api.NodeType.CREATION_METHOD, doclet);
	}

	protected void add_construction_method ( Vala.CreationMethod vm ) {
		var tmp = new Method ( this.settings, vm, this, this.head );
		add_child ( tmp );
	}

	protected void add_methods_and_construction_methods ( Gee.Collection<Vala.Method> vmethods ) {
		foreach ( Vala.Method vm in vmethods ) {
			if ( vm is Vala.CreationMethod ) {
				this.add_construction_method ( (Vala.CreationMethod)vm );
			}
			else {
				this.add_method ( vm );
			}
		}
	}
}

