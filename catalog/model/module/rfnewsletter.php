<?php
	class ModelModuleRfnewsletter extends Model {
		public function save($name,$email) {
			if ($this->db->query("SELECT email FROM `rfnewsletter` WHERE `email` = '$email'")->row) {
				return false;
			}
			$this->db->query("INSERT INTO `rfnewsletter` (`id`, `name`, `email`) VALUES (null, '$name', '$email');");
			return true;
		}
	}
?>