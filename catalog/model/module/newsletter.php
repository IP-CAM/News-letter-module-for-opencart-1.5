<?php
	class ModelModuleNewsletter extends Model {
		public function save($name,$email) {
			if ($this->db->query("SELECT email FROM `newsletter` WHERE `email` = '$email'")->row) {
				return false;
			}
			$this->db->query("INSERT INTO `newsletter` (`id`, `name`, `email`) VALUES (null, '$name', '$email');");
			return true;
		}
	}
?>