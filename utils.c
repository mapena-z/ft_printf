/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mapena-z <mapena-z@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/05/30 00:37:45 by mapena-z          #+#    #+#             */
/*   Updated: 2026/05/30 18:17:57 by mapena-z         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	ft_intlen(int nbr)
{
	int		len;
	long	num;

	len = 0;
	num = nbr;
	if (num == 0)
		return (1);
	if (num < 0)
	{
		num = -num;
		len++;
	}
	while (num > 0)
	{
		num = num / 10;
		len++;
	}
	return (len);
}

int	ft_unsignedintlen(unsigned int nbr)
{
	unsigned int	len;

	len = 0;
	if (nbr == 0)
		return (1);
	while (nbr > 0)
	{
		nbr = nbr / 10;
		len++;
	}
	return (len);
}

char	ft_hexalowercase(unsigned int nbr)
{
	char	*lower;

	lower = "0123456789abcdef";
	return (lower[nbr]);
}

char	ft_hexauppercase(unsigned int nbr)
{
	char	*upper;

	upper = "0123456789ABCDEF";
	return (upper[nbr]);
}
