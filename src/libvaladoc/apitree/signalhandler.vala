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

public interface Valadoc.SignalHandler : Api.Node {
	internal void add_signals ( Gee.Collection<Vala.Signal> vsignals ) {
		foreach ( Vala.Signal vsig in vsignals ) {
			var tmp = new Signal ( this.settings, vsig, this, this.head );
			add_child ( tmp );
		}
	}

	public void visit_signals ( Doclet doclet ) {
		accept_children_by_type (Api.NodeType.SIGNAL, doclet);
	}

	public Gee.Collection<Signal> get_signal_list () {
		return get_children_by_type (Api.NodeType.SIGNAL);
	}
}
